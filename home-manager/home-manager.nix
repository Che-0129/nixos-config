{ ... }: {
    imports = [
        ./modules/gimp.nix
        ./modules/hypr/hypr.nix
        ./modules/inputMethod/inputMethod.nix
        ./modules/kicad/kicad.nix
        ./modules/pkgs.nix
        ./modules/programs/programs.nix
        ./modules/services/services.nix
        ./modules/themes.nix
    ];
    home.stateVersion = "26.11";
    xdg.userDirs = {
        enable = true;
        createDirectories = true;
    };
}
