{
    lib,
    stdenv,
    fetchurl,
    fetchFromGitHub,
    pkg-config,
    intltool,
    gtk2,
    sassc,
    meson,
    ninja,
    glib,
    gnome-shell,
    gnome-themes-extra,
    inkscape,
    cinnamon,
    makeFontsConf,
    python3,
}:
let
    gtk-engine-murrine = stdenv.mkDerivation rec {
        pname = "gtk-engine-murrine";
        version = "0.98.2";
        src = fetchurl {
            url = "mirror://gnome/sources/gtk-engine-murrine/${lib.versions.majorMinor version}/gtk-engine-murrine-${version}.tar.xz";
            sha256 = "129cs5bqw23i76h3nmc29c9mqkm9460iwc8vkl7hs4xr07h8mip9";
        };
        strictDeps = true;
        nativeBuildInputs = [
            pkg-config
            intltool
        ];
        buildInputs = [ gtk2 ];
        NIX_CFLAGS_COMPILE = "-Wno-error=implicit-function-declaration";
        meta = {
            description = "Very flexible theme engine";
            homepage = "https://gitlab.gnome.org/Archive/murrine";
            license = lib.licenses.lgpl3;
            platforms = lib.platforms.linux;
        };
    };
    arc-theme = stdenv.mkDerivation {
        pname = "arc-theme";
        version = "unstable-2025-10-18";
        src = fetchFromGitHub {
            owner = "jnsh";
            repo = "arc-theme";
            rev = "94ac8c7d67d68de0cc688bbd4c3105b9815b446e";
            hash = "sha256-vvZvJmsmeYcJT3xVQLg4tmYXEgHprWJls1fbxA3Jxnw=";
        };
        nativeBuildInputs = [
            meson
            ninja
            sassc
            inkscape
            glib
            python3
        ];
        propagatedUserEnvPkgs = [
            gnome-themes-extra
            gtk-engine-murrine
        ];
        postPatch = ''patchShebangs meson/install-file.py'';
        preBuild = ''
            # Shut up inkscape's warnings about creating profile directory
            export HOME="$TMPDIR"
        '';
        FONTCONFIG_FILE = makeFontsConf { fontDirectories = [ ]; };
        mesonFlags = [
            "-Dcinnamon_version=${cinnamon.version}"
            "-Dgnome_shell_version=${gnome-shell.version}"
            "-Dgnome_shell_gresource=true"
        ];
        passthru = { inherit gtk-engine-murrine; };
        meta = {
            description = "Flat theme with transparent elements for GTK 3, GTK 2 and Gnome Shell";
            homepage = "https://github.com/jnsh/arc-theme";
            license = lib.licenses.gpl3Only;
            platforms = lib.platforms.linux;
        };
    };
in
arc-theme
