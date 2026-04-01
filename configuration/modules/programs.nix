{ pkgs, ... }: {
    programs = {
        dconf.enable = true;
        fish.enable = true;
        steam = {
            enable = true;
            extraCompatPackages = [ pkgs.proton-ge-bin ];
        };
        thunar = {
            enable = true;
            plugins = with pkgs; [
                thunar-archive-plugin
                thunar-volman
            ];
        };
    };
}
