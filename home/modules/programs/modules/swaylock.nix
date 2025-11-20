{ config, pkgs, ... }:

{
    programs.swaylock = {
        enable = true;
        package = pkgs.swaylock-effects;
        settings = {
            daemonize = true;
            ignore-empty-password = true;
            screenshot = true;
            effect-blur = "8x8";
            indicator = true;
            indicator-radius = 128;
            indicator-thickness = 16;
            inside-color = "383c4ae6";
            ring-color = "5294e2";
            key-hl-color = "ffffff80";
            clock = true;
            timestr = "%R";
            datestr = "%m/%d";
            font = "HackGen Console NF:style=Bold";
            font-size = 50;
            text-color = "ffffff";
        };
    };
}
