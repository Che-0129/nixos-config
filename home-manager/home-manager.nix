{
  imports = [
    ./modules/gimp.nix
    ./modules/hypr/idle.nix
    ./modules/hypr/land.nix
    ./modules/hypr/launcher.nix
    ./modules/hypr/lock.nix
    ./modules/hypr/paper.nix
    ./modules/hypr/polkitagent.nix
    ./modules/hypr/toolkit.nix
    ./modules/inputMethod/fcitx5.nix
    ./modules/inputMethod/mozc.nix
    ./modules/pkgs.nix
    ./modules/programs/eza.nix
    ./modules/programs/firefox.nix
    ./modules/programs/fish.nix
    ./modules/programs/foot.nix
    ./modules/programs/nixvim.nix
    ./modules/programs/thunderbird.nix
    ./modules/programs/yazi.nix
    ./modules/programs/zoxide.nix
    ./modules/services/cliphist.nix
    ./modules/services/playerctld.nix
    ./modules/services/syshud.nix
    ./modules/services/udiskie.nix
    ./modules/themes/themes.nix
  ];
  home.stateVersion = "26.11";
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
