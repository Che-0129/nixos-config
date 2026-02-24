{ pkgs, lib, ... }:

{
    home.packages = with pkgs; [
        (lib.hiPrio uutils-coreutils-noprefix)
        android-tools
        aria2
        bat
        brightnessctl
        discord
        dos2unix
        eza
        gimp
        git
        hyprtoolkit
        lmms
        nixos-artwork.wallpapers.simple-blue
        payload-dumper-go
        pcmanfm
        qmk
        telegram-desktop
        trash-cli
        unzip
        vlc
        wl-clipboard
        xarchiver
    ];
}
