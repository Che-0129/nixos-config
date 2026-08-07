{ ... }: {
    imports = [
        ./modules/hypridle.nix
        ./modules/hyprland.nix
        ./modules/hyprlauncher.nix
        ./modules/hyprlock.nix
        ./modules/hyprpaper.nix
        ./modules/hyprtoolkit.nix
    ];
    services.hyprpolkitagent.enable = true;
}
