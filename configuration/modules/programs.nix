{ pkgs, ... }: {
    programs = {
        dconf.enable = true;
        fish.enable = true;
        nh = {
            enable = true;
            clean = {
                enable = true;
                dates = "daily";
                extraArgs = "--keep 3";
            };
            flake = "/home/che/.nixos-config";
        };
        steam = {
            enable = true;
            extraCompatPackages = [ pkgs.proton-ge-bin ];
        };
    };
}
