{ ... }:

{
    imports = [
        ./modules/gtk-qt.nix
        ./modules/hypr/hyprland.nix
        ./modules/inputMethod/inputMethod.nix
        ./modules/pkgs.nix
        ./modules/programs/programs.nix
        ./modules/services.nix
    ];
    home.stateVersion = "26.05";
    xdg = {
        configFile = {
            "hypr/hyprtoolkit.conf".source = ./configs/hypr/hyprtoolkit.conf;
            "libfm".source = ./configs/libfm;
            "pcmanfm".source = ./configs/pcmanfm;
            "xarchiver".source = ./configs/xarchiver;
        };
        userDirs = {
            enable = true;
            createDirectories = true;
        };
    };
}
