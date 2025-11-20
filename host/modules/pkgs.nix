{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        (lib.hiPrio pkgs.uutils-coreutils-noprefix)
        android-tools
        brightnessctl
        neovim
    ];

    fonts.packages = with pkgs; [
        hackgen-nf-font
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        wqy_zenhei
    ];
}
