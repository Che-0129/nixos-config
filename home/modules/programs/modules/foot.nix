{ pkgs, ... }:

{
    programs.foot = {
        enable = true;
        settings = {
            main = {
                include = "${pkgs.foot.themes}/share/foot/themes/nord";
                font = "Moralerspace Neon HW:size=11:style=Bold";
            };
            cursor = {
                style = "beam";
                unfocused-style = "none";
                blink = true;
            };
        };
    };
}
