{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        aria2
        bat
        discord
        eza
        gcc
        gimp
        git
        gnumake
        nodejs
        payload-dumper-go
        pcmanfm
        picotool
        qmk
        qmk-udev-rules
        rustup
        swaybg
        telegram-desktop
        thunderbird
        trash-cli
        unzip
        vlc
        wl-clipboard
        xarchiver
    ];
}
