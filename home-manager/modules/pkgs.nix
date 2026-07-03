{ pkgs, ... }: {
    home.packages = with pkgs; [
        android-tools
        aria2
        bat
        brightnessctl
        discord
        dos2unix
        eza
        git
        jujutsu
        kicad
        p7zip
        payload-dumper-go
        picotool
        qmk
        telegram-desktop
        trash-cli
        unzip
        vlc
        wl-clipboard
        zip
    ];
}
