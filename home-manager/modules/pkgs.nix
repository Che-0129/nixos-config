{ pkgs, ... }: {
    home.packages = with pkgs; [
        android-tools
        aria2
        bat
        brightnessctl
        discord
        dos2unix
        eza
        gimp
        git
        p7zip
        payload-dumper-go
        qmk
        telegram-desktop
        trash-cli
        unzip
        vlc
        wl-clipboard
    ];
}
