{ ... }: {
    wayland.windowManager.hyprland = {
        enable = true;
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
                dim_inactive = true;
                blur.enabled = false;
                shadow.enabled = false;
            };
            animations = {
                bezier = [
                    "custom, 0.15, 0, 0.25, 1"
                ];
                animation = [
                    "windows, 1, 3, custom, popin 10%"
                    "layers, 1, 2.5, custom, slide bottom"
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
                "SUPER SHIFT, H, movewindow, l"
                "SUPER SHIFT, J, movewindow, d"
                "SUPER SHIFT, K, movewindow, u"
                "SUPER SHIFT, L, movewindow, r"
                "SUPER, T, exec, hyprctl keyword general:layout scrolling"
                "SUPER, T, submap, scrolling"
            ];
            bindlru = [ "SUPER, S, exec, systemctl suspend" ];
            bindru = [ "SUPER, Q, killactive" ];
            bindmu = [
                "SUPER, mouse:272, movewindow"
                "SUPER, mouse:273, resizewindow"
            ];
            bindu = [
                "SUPER, F, fullscreen, 1"
                "SUPER SHIFT, F, fullscreen, 0"
                "SUPER, C, exec, foot"
                "SUPER, D, exec, firefox"
                "SUPER SHIFT, D, exec, firefox --private-window"
                "SUPER, space, exec, hyprlauncher"
                "SUPER, V, exec, cliphist list | hyprlauncher -m | cliphist decode | wl-copy"
                ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"
                ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"
                ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
                ", XF86MonBrightnessUp, exec, brightnessctl set 1%+"
                ", XF86MonBrightnessDown, exec, brightnessctl set 1%-"
            ];
            windowrule = [{
                name = "fullscreen";
                "match:fullscreen" = true;
                border_size = 0;
            }];
            layerrule = [
                {
                    name = "hyprpaper";
                    "match:namespace" = "hyprpaper";
                    animation = "fade";
                }
                {
                    name = "waybar";
                    "match:namespace" = "waybar";
                    animation = "slide, top";
                }
            ];
            dwindle.force_split = 2;
            scrolling.column_width = 0.75;
        };
        submaps.scrolling.settings.bind = [
            "SUPER, H, layoutmsg, focus l"
            "SUPER, L, layoutmsg, focus r"
            "SUPER SHIFT, H, layoutmsg, swapcol l"
            "SUPER SHIFT, L, layoutmsg, swapcol r"
            "SUPER, T, exec, hyprctl keyword general:layout dwindle"
            "SUPER, T, submap, reset"
        ];
    };
}
