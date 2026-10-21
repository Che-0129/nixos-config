{ pkgs }:

let
  inherit (pkgs) lib;

  baseFirefox = pkgs.firefox-unwrapped;

  patches = [
    (pkgs.fetchurl {
      url = "https://phabricator.services.mozilla.com/D326385?download=true";
      name = "D326385.patch";
      hash = "sha256-x+eiW5+DeekbHiz2oFwPtlq/3eqKTkWgy1Gz9cN/tp0=";
    })
    (pkgs.fetchurl {
      url = "https://phabricator.services.mozilla.com/D328732?download=true";
      name = "D328732.patch";
      hash = "sha256-IdOi0O4IwiJoXzyKTNkxUgJ4IykId5Z0+UYugvl2OrU=";
    })
  ];

  translateFtl = pkgs.writeText "translate-page.ftl" ''
    main-context-menu-translate-page =
        .label = ページを翻訳…(L)
        .accesskey = l
    main-context-menu-translate-page-to-language =
        .label = ページを { $language } に翻訳(L)
        .accesskey = l
  '';

  patched = pkgs.stdenv.mkDerivation {
    inherit (baseFirefox) pname version;

    dontUnpack = true;
    dontConfigure = true;
    dontBuild = true;

    nativeBuildInputs = with pkgs; [ unzip zip patchutils ];

    installPhase = ''
      cp -rL "${baseFirefox}/." "$out/"
      chmod -R u+w "$out"

      OMNI="$out/lib/firefox/browser/omni.ja"
      D="chrome/browser/content/browser"
      FTL="localization/en-US/browser/translations.ftl"

      WORK=$(mktemp -d)
      cd "$WORK"
      unzip -q "$OMNI" || true

      for p in ${toString patches}; do
        filterdiff -i "*nsContextMenu.sys.mjs" "$p" \
          | patch --no-backup-if-mismatch "$D/nsContextMenu.sys.mjs" || true
      done
      rm -f "$D"/*.rej "$D"/*.orig

      substituteInPlace "$D/nsContextMenu.sys.mjs" \
        --replace-fail '  #translationsLangPairPromise;' \
'  #translationsLangPairPromise;

  /**
   * The promise of the language pair to translate the page with when the
   * translate-page menuitem is activated, resolving to null if no target
   * language could be resolved.
   *
   * @type {Promise<{sourceLanguage: string, targetLanguage: string} | null>}
   */
  #translatePageLangPairPromise;

  /**
   * Aborted when this menu is hidden. Menu items can check its signal to
   * discard asynchronous work that finishes after the menu that started it
   * has closed, since the items are reused by whichever menu opens next.
   *
   * @type {AbortController}
   */
  #menuHiddenController = new AbortController();'

      for s in '#translatePageLangPairPromise;' \
               '#menuHiddenController = new AbortController' \
               '#menuHiddenController.abort()' \
               'translatePage'; do
        grep -q -- "$s" "$D/nsContextMenu.sys.mjs" \
          || { echo "verify failed: nsContextMenu.sys.mjs lacks $s"; exit 1; }
      done

      cat ${translateFtl} >> "$FTL"

      substituteInPlace "$D/browser.xhtml" \
        --replace-fail 'data-l10n-id="main-context-menu-translate-selection"/>' \
        $'data-l10n-id="main-context-menu-translate-selection"/>\n                <menuitem id="context-translate-page"\n                    data-l10n-id="main-context-menu-translate-page"/>'

      substituteInPlace "$D/browser-context.js" \
        --replace-fail 'gContextMenu.openSelectTranslationsPanel(event);' \
        $'gContextMenu.openSelectTranslationsPanel(event);\n        break;\n        case "context-translate-page":\n          gContextMenu.translatePage(event).catch(console.error);'

      rm -f "$OMNI"
      zip -qr9XD "$OMNI" .

      check() {
        local content
        content=$(unzip -p "$OMNI" "$1" 2>/dev/null || true)
        grep -q -- "$2" <<<"$content" \
          || { echo "verify failed: $1 lacks $2"; exit 1; }
      }
      check "$D/nsContextMenu.sys.mjs" '#menuHiddenController = new AbortController'
      check "$D/browser.xhtml" 'context-translate-page'
      check "$D/browser-context.js" 'context-translate-page'
      check "$FTL" 'main-context-menu-translate-page'

      ln -sf ../lib/firefox/firefox "$out/bin/firefox"
    '';

    meta = baseFirefox.meta;
  };
in
(pkgs.wrapFirefox (baseFirefox // patched) { }).overrideAttrs (old: {
  makeWrapperArgs = old.makeWrapperArgs ++ [
    "--suffix" "XDG_DATA_DIRS" ":" (lib.concatStringsSep ":" [
      "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
      "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
    ])
  ];
})
