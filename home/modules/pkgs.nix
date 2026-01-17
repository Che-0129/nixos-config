{ pkgs, ... }:

{
    home.packages = with pkgs; [
        android-tools
        aria2
        bat
        brightnessctl
        dos2unix
        eza
        gimp
        git
        hyprtoolkit
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
