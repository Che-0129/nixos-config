{ config, pkgs, ... }:

{
    programs = {
        dconf.enable = true;
        fish.enable = true;
        steam = {
            enable = true;
            extraCompatPackages = with pkgs; [ proton-ge-bin ];
        };
        uwsm = {
            enable = true;
            waylandCompositors = {
                mango = {
                    prettyName = "Mango";
                    comment = "Mango managed by UWSM";
                    binPath = "/run/current-system/sw/bin/mango";
                };
            };
        };
    };
}
