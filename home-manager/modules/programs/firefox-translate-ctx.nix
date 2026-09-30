{ pkgs }:

let
  inherit (pkgs) lib;

  baseFirefox = pkgs.firefox-unwrapped;

  patches = [
    (pkgs.fetchurl {
      url = "https://phabricator.services.mozilla.com/D326385?download=true";
      name = "D326385.patch";
      hash = "sha256-Da8soTORHLCNRqlie2DMpGCcZJCwlVpqIVRnlwuXwWY=";
    })
    (pkgs.fetchurl {
      url = "https://phabricator.services.mozilla.com/D328732?download=true";
      name = "D328732.patch";
      hash = "sha256-GLtSuy64qCMSGviUaYxsumRdHFo4rWggqFhKVyK8Z1E=";
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
          | patch --no-backup-if-mismatch "$D/nsContextMenu.sys.mjs"
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
        unzip -p "$OMNI" "$1" 2>/dev/null | grep -q -- "$2" \
          || { echo "verify failed: $1 lacks $2"; exit 1; }
      }

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
