{ config, pkgs, ... }:

{
    programs.waybar = {
        enable = true;
        settings = {
            mainBar = {
                height = 30;
                modules-left = [ "backlight" "wireplumber" "battery" ];
                modules-center = [ "clock" ];
                modules-right = [ "cpu" "memory" "tray" ];
                margin-top = 4;
                margin-right= 4;
                margin-left = 4;
                spacing = 24;
                "backlight" = {
                    "format" = "󰖨 {percent}%";
                    "tooltip" = false;
                };
                "wireplumber" = {
                    "format" = "   {volume}%";
                    "format-muted" = "  Muted";
                    "tooltip" = false;
                };
                "battery" = {
                    "states" = {
                        "warning" = 30;
                        "critical" = 15;
                    };
                    "format" = "{icon} {capacity}%";
                    "format-plugged" = " {capacity}%";
                    "format-icons" = [" " " " " " " " " "];
                    "tooltip" = false;
                };
                "clock" = {
                    "interval" = 1;
                    "format" = "{:%F / %T (%a)}";
                    "tooltip" = false;
                };
                "cpu" = {
                    "format" = "  {usage}%";
                    "tooltip" = false;
                };
                "memory" = {
                    "format" = "   {used:0.1f}/{total:0.1f} GiB";
                    "tooltip" = false;
                };
                "tray" = {
                    "spacing" = 16;
                };
            };
        };
        style = ''
window#waybar {
    border-radius: 16px;
    border: 2px solid #5294e2
}

#backlight {
    margin-left: 16px
}

#clock {
    font-size: 16px
}

#tray {
    margin-right: 16px
}
        '';
    };
}
