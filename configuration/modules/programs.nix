{ pkgs, ... }: {
    programs = {
        dconf.enable = true;
        fish.enable = true;
        nh = {
            enable = true;
            clean = {
                enable = true;
                extraArgs = "--keep 3 --keep-since 1d";
            };
            flake = "/home/che/.nixos-config";
        };
        steam = {
            enable = true;
            extraCompatPackages = [ pkgs.proton-ge-bin ];
        };
    };
}
