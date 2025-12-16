{ pkgs, ... }:

{
    home.packages = with pkgs; [
        aria2
        bat
        discord
        dos2unix
        eza
        gcc
        gimp
        git
        gnumake
        lxsession
        nodejs
        payload-dumper-go
        pcmanfm
        picotool
        qmk
        qmk-udev-rules
        rustup
        swaybg
        sway-audio-idle-inhibit
        telegram-desktop
        trash-cli
        unzip
        vlc
        wl-clipboard
        xarchiver
    ];
}
