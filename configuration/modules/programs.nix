{ pkgs, ... }: {
    programs = {
        dconf.enable = true;
        fish.enable = true;
        steam = {
            enable = true;
            extraCompatPackages = [ pkgs.proton-ge-bin ];
        };
        thunar.enable = true;
    };
}
