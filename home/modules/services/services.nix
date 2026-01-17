{ ... }:

{
    imports = [
        ./modules/hypridle.nix
        ./modules/hyprlauncher.nix
        ./modules/hyprpaper.nix
    ];

    services = {
        cliphist.enable = true;
        hyprpolkitagent.enable = true;
        playerctld.enable = true;
    };
}
