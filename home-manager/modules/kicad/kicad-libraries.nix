{ stdenvNoCC, fetchFromGitHub }:
stdenvNoCC.mkDerivation {
    pname = "kicad-libraries";
    version = "209c43f";
    src = fetchFromGitHub {
        owner = "Che-0129";
        repo = "KiCAD-Libraries";
        rev = "209c43f";
        hash = "sha256-fcBc+3vO9oPrvxZ79DmTktEZ2ycB2zeX3r4/iXRj8FQ=";
    };
    installPhase = ''
        mkdir -p $out
        cp -r . $out/
    '';
}
