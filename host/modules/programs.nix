{ pkgs, ... }:

{
    programs = {
        dconf.enable = true;
        fish.enable = true;
        steam = {
            enable = true;
            extraCompatPackages = [ pkgs.proton-ge-bin ];
        };
        uwsm = {
            enable = true;
            waylandCompositors.river = {
                prettyName = "River";
                binPath = "/etc/profiles/per-user/che/bin/river";
            };
        };
    };
}
