{ pkgs, lib, ... }:

{
    environment.systemPackages = [ (lib.hiPrio pkgs.uutils-coreutils-noprefix) ];

    fonts.packages = with pkgs; [
        hackgen-nf-font
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        wqy_zenhei
    ];
}
