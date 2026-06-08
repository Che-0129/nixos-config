{ pkgs, ... }: {
    imports = [
        ./modules/hypridle.nix
        ./modules/hyprland.nix
        ./modules/hyprlauncher.nix
        ./modules/hyprlock.nix
        ./modules/hyprpaper.nix
        ./modules/hyprtoolkit.nix
    ];
    home.packages = [ pkgs.hyprshot ];
    services.hyprpolkitagent.enable = true;
}
