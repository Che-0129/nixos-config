{ config, pkgs, ... }:

{
    imports = [
        ./modules/fish.nix
        ./modules/foot.nix
        ./modules/fuzzel.nix
        ./modules/neovim.nix
        ./modules/swaylock.nix
        ./modules/waybar.nix
    ];
}
