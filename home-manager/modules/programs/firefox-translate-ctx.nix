{ pkgs }:

let
  inherit (pkgs) lib;

  baseFirefox = pkgs.firefox-unwrapped;

  patches = [
    (pkgs.fetchurl {
      url = "https://phabricator.services.mozilla.com/D326385?download=true";
      name = "D326385.patch";
      hash = "sha256-hXjARSNljFqLAZ5QWe3cZCYgYQK/oEzaosfbp6WPXBY=";
    })
    (pkgs.fetchurl {
      url = "https://phabricator.services.mozilla.com/D328732?download=true";
      name = "D328732.patch";
      hash = "sha256-YEtA1LsrMmc8HBbdusjX3+5UWpBQjuMr1UlIUYpaSD0=";
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

  langPairField = pkgs.writeText "lang-pair-field.txt" ''

      /**
       * The promise of the language pair to translate the page with when the
       * translate-page menuitem is activated, resolving to null if no target
       * language could be resolved.
       *
       * @type {Promise<{sourceLanguage: string, targetLanguage: string} | null>}
       */
      #translatePageLangPairPromise;
  '';

  menuHiddenField = pkgs.writeText "menu-hidden-field.txt" ''

      /**
       * Aborted when this menu is hidden. Menu items can check its signal to
       * discard asynchronous work that finishes after the menu that started it
       * has closed, since the items are reused by whichever menu opens next.
       *
       * @type {AbortController}
       */
      #menuHiddenController = new AbortController();
  '';

  patched = pkgs.stdenv.mkDerivation {
    inherit (baseFirefox) pname version;

    dontUnpack = true;
    dontConfigure = true;
    dontBuild = true;

    nativeBuildInputs = with pkgs; [ unzip zip patchutils nodejs ];

    installPhase = ''
      cp -rL "${baseFirefox}/." "$out/"
      chmod -R u+w "$out"

      OMNI="$out/lib/firefox/browser/omni.ja"
      D="chrome/browser/content/browser"
      FTL="localization/en-US/browser/translations.ftl"
      TARGET="$D/nsContextMenu.sys.mjs"

      WORK=$(mktemp -d)
      cd "$WORK"
      unzip -q "$OMNI" || true

      for p in ${toString patches}; do
        echo "=== applying $p ==="
        filterdiff -i "*nsContextMenu.sys.mjs" "$p" \
          | patch --no-backup-if-mismatch -r "$WORK/rejects.rej" "$TARGET" || true
        if [ -s "$WORK/rejects.rej" ]; then
          echo "--- rejected hunks from $p ---"
          cat "$WORK/rejects.rej"
          rm -f "$WORK/rejects.rej"
        fi
      done

      if ! grep -q 'this\.showTranslatePageItem()' "$TARGET"; then
        substituteInPlace "$TARGET" \
          --replace-fail 'this.showTranslateSelectionItem();' \
          $'this.showTranslateSelectionItem();\n    this.showTranslatePageItem();'
      fi

      if ! grep -Eq '^[[:space:]]*(get |set )?#translatePageLangPairPromise' "$TARGET"; then
        echo "inserting #translatePageLangPairPromise"
        sed -i '/^  #translationsLangPairPromise;$/r ${langPairField}' "$TARGET"
      fi
      if ! grep -Eq '^[[:space:]]*#menuHiddenController' "$TARGET"; then
        echo "inserting #menuHiddenController"
        sed -i '/^  #translationsLangPairPromise;$/r ${menuHiddenField}' "$TARGET"
      fi

      node --check "$TARGET" \
        || { echo "syntax check failed: $TARGET"; exit 1; }

      for s in 'showTranslatePageItem' \
               '#menuHiddenController.abort()' \
               'translatePage('; do
        grep -qF -- "$s" "$TARGET" \
          || { echo "verify failed: $TARGET lacks $s"; exit 1; }
      done

      if ! grep -q 'id="context-translate-page"' "$D/browser.xhtml"; then
        substituteInPlace "$D/browser.xhtml" \
          --replace-fail 'data-l10n-id="main-context-menu-translate-selection"/>' \
          $'data-l10n-id="main-context-menu-translate-selection"/>\n                <menuitem id="context-translate-page"\n                    data-l10n-id="main-context-menu-translate-page"/>'
      fi

      if ! grep -q 'context-translate-page' "$D/browser-context.js"; then
        substituteInPlace "$D/browser-context.js" \
          --replace-fail 'gContextMenu.openSelectTranslationsPanel(event);' \
          $'gContextMenu.openSelectTranslationsPanel(event);\n        break;\n        case "context-translate-page":\n          gContextMenu.translatePage(event).catch(console.error);'
      fi

      if ! grep -q '^main-context-menu-translate-page =' "$FTL"; then
        cat ${translateFtl} >> "$FTL"
      fi

      rm -f "$OMNI"
      zip -qr9XD "$OMNI" .

      check() {
        local content
        content=$(unzip -p "$OMNI" "$1" 2>/dev/null || true)
        grep -qF -- "$2" <<<"$content" \
          || { echo "verify failed: $1 lacks $2"; exit 1; }
      }
      check "$TARGET" 'showTranslatePageItem'
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
