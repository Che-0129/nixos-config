{ pkgs }:

let
  inherit (pkgs) lib;

  translateFtl = pkgs.writeText "translate-page.ftl" ''
    main-context-menu-translate-page =
        .label = Translate Page…
        .accesskey = l
    main-context-menu-translate-page-to-language =
        .label = Translate Page to { $language }
        .accesskey = l
  '';

  injectMenuScript = pkgs.writeText "inject-translate-page.py" ''
    import sys

    d = sys.argv[1]

    def insert_after(path, marker, addition, already_applied):
        with open(path, encoding="utf-8") as f:
            s = f.read()
        if already_applied in s:
            return
        if s.count(marker) != 1:
            sys.exit(f"{path}: insertion point not found (count={s.count(marker)})")
        s = s.replace(marker, marker + addition, 1)
        with open(path, "w", encoding="utf-8") as f:
            f.write(s)


    insert_after(
        f"{d}/browser.xhtml",
        'data-l10n-id="main-context-menu-translate-selection"/>',
        '\n                <menuitem id="context-translate-page"'
        '\n                    data-l10n-id="main-context-menu-translate-page"/>',
        'id="context-translate-page"',
    )

    insert_after(
        f"{d}/browser-context.js",
        "gContextMenu.openSelectTranslationsPanel(event);",
        "\n        break;"
        '\n        case "context-translate-page":'
        "\n          gContextMenu.translatePage(event).catch(console.error);",
        'case "context-translate-page"',
    )
  '';

  runtimeLibs = with pkgs; [
    udev libva libgbm libnotify libxscrnsaver cups pciutils vulkan-loader
    pipewire ffmpeg_7 libglvnd gtk3 libcanberra-gtk3 speechd-minimal
    glib dbus xdg-desktop-portal xdg-desktop-portal-gtk
    pango gdk-pixbuf at-spi2-core libdrm mesa
    libpulseaudio wireplumber alsa-lib
  ];

  xdgDataDirs = lib.concatStringsSep ":" [
    "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
    "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
    "${pkgs.adwaita-icon-theme}/share"
  ];

  gioExtraModules = lib.concatStringsSep ":" [
    "${pkgs.glib-networking}/lib/gio/modules"
    "${pkgs.dconf}/lib/gio/modules"
  ];
in

lib.makeOverridable ({
  baseFirefox ? pkgs.firefox-unwrapped,
  patchD326385 ? pkgs.fetchurl {
    url = "https://phabricator.services.mozilla.com/D326385?download=true";
    name = "D326385.patch";
    hash = "sha256-Da8soTORHLCNRqlie2DMpGCcZJCwlVpqIVRnlwuXwWY=";
  },
  patchD328732 ? pkgs.fetchurl {
    url = "https://phabricator.services.mozilla.com/D328732?download=true";
    name = "D328732.patch";
    hash = "sha256-GLtSuy64qCMSGviUaYxsumRdHFo4rWggqFhKVyK8Z1E=";
  }
}:

pkgs.stdenv.mkDerivation {
  pname = "firefox";
  inherit (baseFirefox) version;

  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;

  nativeBuildInputs = with pkgs; [
    unzip zip patchutils patch python3 makeWrapper
  ];

  installPhase = ''
    set -euo pipefail

    cp -rL "${baseFirefox}/." "$out/"
    chmod -R u+w "$out"

    OMNI="$out/lib/firefox/browser/omni.ja"
    D="chrome/browser/content/browser"
    FTL="localization/en-US/browser/translations.ftl"

    WORK=$(mktemp -d)
    cd "$WORK"
    unzip -q "$OMNI" || true

    for p in ${patchD326385} ${patchD328732}; do
      filterdiff -i "*nsContextMenu.sys.mjs" "$p" \
        | patch --no-backup-if-mismatch "$D/nsContextMenu.sys.mjs"
    done

    cat ${translateFtl} >> "$FTL"
    python3 ${injectMenuScript} "$D"

    rm -f "$OMNI"
    zip -qr9XD "$OMNI" .

    check() {
      unzip -p "$OMNI" "$1" 2>/dev/null | grep -q -- "$2" \
        || { echo "verify failed: $1 lacks $2"; exit 1; }
    }
    check "$D/nsContextMenu.sys.mjs" "async translatePage"
    check "$D/browser-context.js" 'case "context-translate-page"'
    check "$D/browser.xhtml" 'id="context-translate-page"'
    check "$FTL" "main-context-menu-translate-page-to-language"

    mv "$out/lib/firefox/firefox" "$out/lib/firefox/.firefox-real"
    makeWrapper "$out/lib/firefox/.firefox-real" "$out/lib/firefox/firefox" \
      --set MOZ_APP_LAUNCHER firefox \
      --set MOZ_LEGACY_PROFILES 1 \
      --set MOZ_ALLOW_DOWNGRADE 1 \
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath runtimeLibs}" \
      --suffix XDG_DATA_DIRS : "${xdgDataDirs}" \
      --suffix GTK_PATH : "${pkgs.libcanberra-gtk3}/lib/gtk-3.0/modules" \
      --suffix GIO_EXTRA_MODULES : "${gioExtraModules}" \
      --set-default MOZ_ENABLE_WAYLAND 1 \
      --set-default GTK_USE_PORTAL 1

    mkdir -p "$out/bin"
    rm -f "$out/bin/firefox"
    ln -s "../lib/firefox/firefox" "$out/bin/firefox"
  '';

  meta = baseFirefox.meta // { mainProgram = "firefox"; };
}) {}
