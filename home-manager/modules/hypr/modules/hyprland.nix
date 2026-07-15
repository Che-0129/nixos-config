{ lib, ... }: {
    wayland.windowManager.hyprland = {
        enable = true;
        settings = {
            config = {
                general = {
                    border_size = 0;
                    gaps_in = 4;
                    gaps_out = 8;
                    layout = "scrolling";
                    no_focus_fallback = true;
                };
                decoration = {
                    rounding = 8;
                    dim_inactive = true;
                    blur.enabled = false;
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
                        tap_to_click = false;
                    };
                };
                misc = {
                    disable_hyprland_logo = true;
                    font_family = "Moralerspace Neon HW";
                    focus_on_activate = true;
                };
                cursor.no_warps = true;
                ecosystem = {
                    no_update_news = true;
                    no_donation_nag = true;
                };
                monitor = lib.generators.mkLuaInline ''hl.monitor({ output = "", mode = "preferred", scale = 1.0 })'';
                scrolling = {
                    column_width = 0.75;
                    explicit_column_widths = "0.75, 1.0";
                    wrap_swapcol = false;
                };
            };
            bind = [
                { _args = [ "SUPER + C" (lib.generators.mkLuaInline "hl.dsp.exec_cmd('foot')") ]; }
                { _args = [ "SUPER + D" (lib.generators.mkLuaInline "hl.dsp.exec_cmd('firefox')") ]; }
                { _args = [ "SUPER + SHIFT + D" (lib.generators.mkLuaInline "hl.dsp.exec_cmd('firefox --private-window')") ]; }
                { _args = [ "SUPER + space" (lib.generators.mkLuaInline "hl.dsp.exec_cmd('hyprlauncher')") ]; }
                { _args = [ "SUPER + E" (lib.generators.mkLuaInline "hl.dsp.exec_cmd('foot -e yazi')") ]; }
                { _args = [ "SUPER + V" (lib.generators.mkLuaInline "hl.dsp.exec_cmd('cliphist list | hyprlauncher -m | cliphist decode | wl-copy')") ]; }
                { _args = [ "SUPER + P" (lib.generators.mkLuaInline "hl.dsp.exec_cmd('hyprshot -m region -o ~/Downloads/')") ]; }
                { _args = [ "SUPER + mouse:272" (lib.generators.mkLuaInline "hl.dsp.window.drag()") { mouse = true; } ]; }
                { _args = [ "SUPER + mouse:273" (lib.generators.mkLuaInline "hl.dsp.window.resize()") { mouse = true; } ]; }
                { _args = [ "XF86AudioLowerVolume" (lib.generators.mkLuaInline "hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-')") ]; }
                { _args = [ "XF86AudioRaiseVolume" (lib.generators.mkLuaInline "hl.dsp.exec_cmd('wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+')") ]; }
                { _args = [ "XF86AudioMute" (lib.generators.mkLuaInline "hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_SINK@ toggle')") ]; }
                { _args = [ "XF86MonBrightnessDown" (lib.generators.mkLuaInline "hl.dsp.exec_cmd('brightnessctl set 1%-')") ]; }
                { _args = [ "XF86MonBrightnessUp" (lib.generators.mkLuaInline "hl.dsp.exec_cmd('brightnessctl set 1%+')") ]; }
                { _args = [ "SUPER + H" (lib.generators.mkLuaInline "hl.dsp.layout('focus l')") ]; }
                { _args = [ "SUPER + J" (lib.generators.mkLuaInline "hl.dsp.layout('focus d')") ]; }
                { _args = [ "SUPER + K" (lib.generators.mkLuaInline "hl.dsp.layout('focus u')") ]; }
                { _args = [ "SUPER + L" (lib.generators.mkLuaInline "hl.dsp.layout('focus r')") ]; }
                { _args = [ "SUPER + SHIFT + H" (lib.generators.mkLuaInline "hl.dsp.layout('swapcol l')") ]; }
                { _args = [ "SUPER + SHIFT + L" (lib.generators.mkLuaInline "hl.dsp.layout('swapcol r')") ]; }
                { _args = [ "SUPER + CTRL + H" (lib.generators.mkLuaInline "hl.dsp.window.move({ direction = 'l' })") ]; }
                { _args = [ "SUPER + CTRL + J" (lib.generators.mkLuaInline "hl.dsp.window.move({ direction = 'd' })") ]; }
                { _args = [ "SUPER + CTRL + K" (lib.generators.mkLuaInline "hl.dsp.window.move({ direction = 'u' })") ]; }
                { _args = [ "SUPER + CTRL + L" (lib.generators.mkLuaInline "hl.dsp.window.move({ direction = 'r' })") ]; }
                { _args = [ "SUPER + Q" (lib.generators.mkLuaInline "hl.dsp.window.close()") { release = true; } ]; }
                { _args = [ "SUPER + SHIFT + CTRL + Q" (lib.generators.mkLuaInline "hl.dsp.window.kill()") { release = true; } ]; }
                { _args = [ "SUPER + S" (lib.generators.mkLuaInline "hl.dsp.exec_cmd('systemctl suspend')") { locked = true; release = true; } ]; }
                { _args = [ "SUPER + F" (lib.generators.mkLuaInline "hl.dsp.layout('colresize +conf')") ]; }
                { _args = [ "SUPER + G" (lib.generators.mkLuaInline "hl.dsp.layout('colresize 0.5')") ]; }
                { _args = [ "SUPER + W" (lib.generators.mkLuaInline ''
                    function()
                        local time = os.date("%m/%d (%a) %R")
                        hl.notification.create({
                            text = "🕓️ "..time,
                            duration = 3000,
                            font_size = 24,
                            color = "rgb(5294e2)",
                            icon = "NONE"
                        })
                    end
                '') ]; }
            ];
            device = [
                {
                    _args = [{
                        name = "elan2204:00-04f3:30f5-touchpad";
                        sensitivity = 0.175;
                    }];
                }
                {
                    _args = [{
                        name = "logitech-mx-ergo-1";
                        sensitivity = -0.85;
                    }];
                }
            ];
            animation = [
                {
                    leaf = "windows";
                    enabled = true;
                    speed = 3;
                    bezier = "custom";
                    style = "popin 10%";
                }
                {
                    leaf = "layers";
                    enabled = true;
                    speed = 2.5;
                    bezier = "custom";
                    style = "slide bottom";
                }
            ];
            curve = [{
                _args = [
                    "custom" {
                        type = "bezier";
                        points = [
                            [ 0.15 0 ]
                            [ 0.25 1 ]
                        ];
                    }
                ];
            }];
            layer_rule = [
                {
                    match.namespace = "hyprpaper";
                    animation = "fade";
                }
                {
                    match.namespace = "selection";
                    animation = "fade";
                }
                {
                    match.namespace = "syshud";
                    animation = "slide, top";
                }
            ];
        };
    };
}
