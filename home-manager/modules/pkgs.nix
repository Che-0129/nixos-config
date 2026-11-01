{ pkgs, ... }: {
  home.packages = with pkgs; [
    android-tools
    blender
    discord
    dos2unix
    kicad
    p7zip
    payload-dumper-go
    qmk
    telegram-desktop
    trash-cli
    unzip
    vlc
    wl-clipboard
    zip
  ];
}
