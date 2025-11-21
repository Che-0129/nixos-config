{ config, pkgs, ... }:

{
    imports = [
        ./modules/firefox.nix
        ./modules/fish.nix
        ./modules/foot.nix
        ./modules/fuzzel.nix
        ./modules/neovim.nix
        ./modules/swaylock.nix
        ./modules/thunderbird.nix
        ./modules/waybar.nix
    ];
}
