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

    home = {
        stateVersion = "26.05";
        sessionVariables.NIXOS_OZONE_WL = "1";
        file = {
            ".config/hypr/hyprtoolkit.conf".source = ./configs/hypr/hyprtoolkit.conf;
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
