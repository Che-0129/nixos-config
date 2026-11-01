{ pkgs, ... }: {
  home.packages = with pkgs; [
    android-tools
    blender
    brightnessctl
    discord
    dos2unix
    grim
    kicad
    p7zip
    payload-dumper-go
    qmk
    slurp
    telegram-desktop
    trash-cli
    unzip
    vlc
    wl-clipboard
    zip
  ];
}
