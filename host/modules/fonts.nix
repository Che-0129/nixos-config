{ pkgs, ... }:

{
    fonts.packages = with pkgs; [
        moralerspace-hw
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        wqy_zenhei
    ];
}
