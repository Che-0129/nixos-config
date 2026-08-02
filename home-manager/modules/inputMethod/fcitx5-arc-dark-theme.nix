{ stdenvNoCC, fetchFromGitHub, ... }: stdenvNoCC.mkDerivation {
    pname = "fcitx5-arc-dark-theme";
    version = "0-unstable-2026-08-02";
    src = fetchFromGitHub {
        owner = "Che-0129";
        repo = "fcitx5-arc-dark-theme";
        rev = "78a88b2";
        hash = "sha256-LgCKExd2XwMwFm4mPBwLDH7825DcpMJAW1bBv1TgL9c=";
    };
    installPhase = ''
        runHook preInstall
        mkdir -pv $out/share/fcitx5/themes/
        cp -rv Arc-Dark $out/share/fcitx5/themes
        runHook postInstall
    '';
}
