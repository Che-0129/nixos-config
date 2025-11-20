{ config, pkgs, ... }:

{
    programs.foot = {
        enable = true;
        settings = {
            main = {
                include = "${pkgs.foot.themes}/share/foot/themes/nord";
                font = "HackGen Console NF:size=11:style=Bold";
            };
            cursor = {
                style = "beam";
                unfocused-style = "none";
                blink = true;
            };
        };
    };
}
