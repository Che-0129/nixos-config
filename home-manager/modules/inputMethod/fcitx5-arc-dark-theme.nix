{ stdenvNoCC, fetchFromGitHub, ... }: stdenvNoCC.mkDerivation {
    pname = "fcitx5-arc-dark-theme";
    version = "0-unstable-2026-08-02";
    src = fetchFromGitHub {
        owner = "Che-0129";
        repo = "fcitx5-arc-dark-theme";
        rev = "78a88b2c26fb944cd323a12b33db5d8c733174f7";
        hash = "sha256-XBj4vlXpdajkJbU/rCoiO8HZnVns8TxRnsyR1Q9BSRY=";
    };
    installPhase = ''
        runHook preInstall
        mkdir -pv $out/share/fcitx5/themes/
        cp -rv Arc-Dark $out/share/fcitx5/themes
        runHook postInstall
    '';
}
