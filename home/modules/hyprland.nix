{ pkgs, ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        plugins = [ pkgs.hyprlandPlugins.hyprscrolling ];
        settings = {
            general = {
                border_size = 2;
                gaps_in = 2;
                gaps_out = 4;
                "col.inactive_border" = "rgb(404552)";
                "col.active_border" = "rgb(5294e2)";
                no_focus_fallback = true;
            };

            decoration = {
                rounding = 8;
                inactive_opacity = 0.9;
                blur.enabled = false;
                shadow.enabled = false;
            };

            animations = {
                bezier = [
                    "bezier, 0.25, 1, 0.3, 1"
                    "linear, 1, 1, 1, 1"
                ];
                animation = [
                    "windows, 1, 10, bezier"
                    "windowsOut, 1, 10, bezier, popin, 30%"
                    "border, 1, 10, bezier"
                    "borderangle, 1, 15, linear, loop"
                    "fade, 1, 10, bezier"
                ];
            };

            input = {
                kb_layout = "jp";
                repeat_delay = 300;
                accel_profile = "adaptive";
                follow_mouse = 2;
                touchpad = {
                    natural_scroll = true;
                    scroll_factor = 0.4;
                    clickfinger_behavior = true;
                    tap-to-click = false;
                };
            };

            device = [
                {
                    name = "elan2204:00-04f3:30f5-touchpad";
                    sensitivity = 0.175;
                }
                {
                    name = "logitech-mx-ergo-1";
                    sensitivity = -0.85;
                }
            ];

            misc.disable_hyprland_logo = true;
            xwayland.force_zero_scaling = true;
            cursor.no_warps = true;

            ecosystem = {
                no_update_news = true;
                no_donation_nag = true;
            };

            monitor = ", preferred, auto, 1";

            bind = [
                "SUPER, H, movefocus, l"
                "SUPER, J, movefocus, d"
                "SUPER, K, movefocus, u"
                "SUPER, L, movefocus, r"
                "SUPER CTRL, H, movewindow, l"
                "SUPER CTRL, J, movewindow, d"
                "SUPER CTRL, K, movewindow, u"
                "SUPER CTRL, L, movewindow, r"
                "SUPER, S, exec, hyprctl keyword general:layout scrolling"
                "SUPER, S, submap, scrolling"
            ];

            bindu = [
                "SUPER, F, fullscreen, 1"
                "SUPER CTRL, F, fullscreen, 0"
                "SUPER, C, exec, foot"
                "SUPER, D, exec, firefox"
                "SUPER CTRL, D, exec, firefox --private-window"
                "SUPER, space, exec, hyprlauncher"
                "SUPER, V, exec, cliphist list | hyprlauncher -m | cliphist decode | wl-copy"
                "SUPER, E, exec, pcmanfm"
                "SUPER SHIFT, S, exec, systemctl suspend"
                ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
            ];

            bindleu = [
                ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
                ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
                ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
                ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
            ];

            bindru = [ "SUPER, Q, killactive" ];

            bindmu = [
                "SUPER, mouse:272, movewindow"
                "SUPER, mouse:273, resizewindow"
            ];

            windowrule = [
                {
                    name = "fullscreen_border";
                    "match:fullscreen" = true;
                    border_size = 4;
                    border_color = "rgb(5294e2) rgb(404552) 45deg";
                }
            ];

            dwindle.force_split = 2;
            env = [ "XCURSOR_THEME, Adwaita" ];

            plugin.hyprscrolling = {
                fullscreen_on_one_column = true;
                column_width = 0.8;
                focus_fit_method = 1;
            };
        };
        submaps.scrolling.settings.bind = [
            "SUPER, H, layoutmsg, focus l"
            "SUPER, L, layoutmsg, focus r"
            "SUPER CTRL, H, layoutmsg, swapcol l"
            "SUPER CTRL, L, layoutmsg, swapcol r"
            "SUPER, S, exec, hyprctl keyword general:layout dwindle"
            "SUPER, S, submap, reset"
        ];
    };
}
