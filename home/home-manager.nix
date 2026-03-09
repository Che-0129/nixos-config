{ ... }:

{
    imports = [
        ./modules/hypr/hyprland.nix
        ./modules/inputMethod/inputMethod.nix
        ./modules/pkgs.nix
        ./modules/programs/programs.nix
        ./modules/services.nix
        ./modules/themes.nix
    ];
    home.stateVersion = "26.05";
    xdg = {
        configFile = {
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
