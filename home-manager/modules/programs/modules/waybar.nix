{ ... }: {
    programs.waybar = {
        enable = true;
        settings = {
            mainBar = {
                height = 30;
                modules-left = [ "backlight" "wireplumber" ];
                modules-center = [ "clock" ];
                modules-right = [ "battery" "tray" ];
                margin = "4 4 0 4";
                spacing = 24;
                "backlight" = {
                    "format" = "󰖨  {percent}%";
                    "tooltip" = false;
                };
                "wireplumber" = {
                    "format" = "    {volume}%";
                    "format-muted" = "   Muted";
                    "tooltip" = false;
                };
                "clock" = {
                    "interval" = 1;
                    "format" = "{:%F / %T (%a)}";
                    "tooltip" = false;
                };
                "battery" = {
                    "states" = {
                        "warning" = 30;
                        "critical" = 15;
                    };
                    "format" = "{icon}   {capacity}%";
                    "format-plugged" = "  {capacity}% ";
                    "format-icons" = ["" "" "" "" ""];
                    "tooltip" = false;
                };
                "tray"."spacing" = 16;
            };
        };
        style = ''
            window#waybar {
                border-radius: 8px;
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
        systemd.enable = true;
    };
}
