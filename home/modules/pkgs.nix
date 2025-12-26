{ pkgs, ... }:

{
    home.packages = with pkgs; [
        aria2
        bat
        brightnessctl
        dos2unix
        eza
        gimp
        git
        lxsession
        nixos-artwork.wallpapers.simple-blue
        payload-dumper-go
        pcmanfm
        qmk
        qmk-udev-rules
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
