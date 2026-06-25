{ stdenvNoCC, fetchFromGitHub, ... }: stdenvNoCC.mkDerivation {
    pname = "fcitx5-arc-theme";
    version = "0-unstable-2026-06-26";
    src = fetchFromGitHub {
        owner = "Che-0129";
        repo = "fcitx5-arc-theme";
        rev = "dbade7c74b87299280c2f0c4d50922834eaee723";
        hash = "sha256-XBj4vlXpdajkJbU/rCoiO8HZnVns8TxRnsyR1Q9BSRY=";
    };
    installPhase = ''
        runHook preInstall
        mkdir -pv $out/share/fcitx5/themes/
        cp -rv Arc* $out/share/fcitx5/themes
        runHook postInstall
    '';
}
