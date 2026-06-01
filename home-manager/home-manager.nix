{ ... }: {
    imports = [
        ./modules/gimp.nix
        ./modules/hypr/hypr.nix
        ./modules/inputMethod/inputMethod.nix
        ./modules/pkgs.nix
        ./modules/programs/programs.nix
        ./modules/services/services.nix
        ./modules/themes.nix
    ];
    home.stateVersion = "26.05";
    xdg.userDirs = {
        enable = true;
        createDirectories = true;
    };
}
