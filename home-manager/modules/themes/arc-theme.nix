{
    stdenv,
    fetchFromGitHub,
    sassc,
    meson,
    ninja,
    glib,
    inkscape,
    makeFontsConf,
    python3,
}:
stdenv.mkDerivation {
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
    postPatch = ''patchShebangs meson/install-file.py'';
    preBuild = ''export HOME="$TMPDIR"'';
    FONTCONFIG_FILE = makeFontsConf { fontDirectories = []; };
    mesonFlags = [
        "-Dthemes=gtk3,gtk4"
        "-Dvariants=dark"
        "-Dtransparency=false"
    ];
}
