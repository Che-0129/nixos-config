{ config, pkgs, ...}:

{
    imports = [
        ./modules/gtk.nix
        ./modules/inputMethod.nix
        ./modules/mango.nix
        ./modules/pkgs.nix
        ./modules/programs/programs.nix
        ./modules/services/services.nix
    ];

    home = {
        username = "yuto";
        homeDirectory = "/home/yuto";
        stateVersion = "25.11";
        file = {
            ".config/libfm".source = ./configs/libfm;
            ".config/mozc/config1.db".source = ./configs/mozc/config1.db;
            ".config/pcmanfm".source = ./configs/pcmanfm;
            ".config/xarchiver".source = ./configs/xarchiver;
        };
    };

    xdg.userDirs = {
        enable = true;
        createDirectories = true;
    };
}
