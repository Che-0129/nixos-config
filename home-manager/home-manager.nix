{ pkgs, ... }: {
    imports = [
        ./modules/gimp.nix
        ./modules/hypr/hypr.nix
        ./modules/inputMethod/inputMethod.nix
        ./modules/pkgs.nix
        ./modules/programs/programs.nix
        ./modules/services/services.nix
        ./modules/themes.nix
    ];
    home = {
        stateVersion = "26.11";
        sessionVariables = {
            KICAD10_SYMBOL_DIR = "${pkgs.kicad.libraries.symbols}/share/kicad/symbols";
            KICAD10_FOOTPRINT_DIR = "${pkgs.kicad.libraries.footprints}/share/kicad/footprints";
            KICAD10_TEMPLATE_DIR = "${pkgs.kicad.libraries.symbols}/share/kicad/template";
        };
    };
    xdg.userDirs = {
        enable = true;
        createDirectories = true;
    };
}
