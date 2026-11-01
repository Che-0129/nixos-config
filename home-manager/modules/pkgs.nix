{ pkgs, ... }: {
  home.packages = with pkgs; [
    android-tools
    blender
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
