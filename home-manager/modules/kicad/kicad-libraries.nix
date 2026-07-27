{ stdenvNoCC, fetchFromGitHub }:
stdenvNoCC.mkDerivation {
    pname = "kicad-libraries";
    version = "3978918";
    src = fetchFromGitHub {
        owner = "Che-0129";
        repo = "KiCAD-Libraries";
        rev = "3978918";
        hash = "sha256-vJvoW3giwilmnBszKGlT4T5D/LEK2tOcKR+o3BQ2/uU=";
    };
    installPhase = ''
        mkdir -p $out
        cp -r . $out/
    '';
}
