{ lib, ... }:
let
    mkBind = keys: luaDispatcher: flags: {
        _args = [
            keys
            (lib.generators.mkLuaInline luaDispatcher)
        ] ++ lib.optional (flags != {}) flags;
    };
in
{
    wayland.windowManager.hyprland = {
        enable = true;
        settings = {
            config = {
                general = {
                    border_size = 0;
                    gaps_in = 4;
                    gaps_out = 8;
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
                };
                cursor.no_warps = true;
                ecosystem = {
                    no_update_news = true;
                    no_donation_nag = true;
                };
                monitor = lib.generators.mkLuaInline ''hl.monitor({ output = "", mode = "preferred", scale = 1.0 })'';
                dwindle.force_split = 2;
                scrolling = {
                    column_width = 0.75;
                    explicit_column_widths = "0.75, 1.0";
                    wrap_swapcol = false;
                };
            };
            bind = [
                (mkBind "SUPER + C"  "hl.dsp.exec_cmd('foot')" { submap_universal = true; })
                (mkBind "SUPER + D"  "hl.dsp.exec_cmd('firefox')" { submap_universal = true; })
                (mkBind "SUPER + SHIFT + D" "hl.dsp.exec_cmd('firefox --private-window')" { submap_universal = true; })
                (mkBind "SUPER + space" "hl.dsp.exec_cmd('hyprlauncher')" { submap_universal = true; })
                (mkBind "SUPER + V" "hl.dsp.exec_cmd('cliphist list | hyprlauncher -m | cliphist decode | wl-copy')" { submap_universal = true; })
                (mkBind "SUPER + P" "hl.dsp.exec_cmd('hyprshot -m region -o ~/Downloads/')" { submap_universal = true; })
                (mkBind "SUPER + mouse:272" "hl.dsp.window.drag()" { mouse = true; submap_universal = true; })
                (mkBind "SUPER + mouse:273" "hl.dsp.window.resize()" { mouse = true; submap_universal = true; })
                (mkBind "XF86AudioLowerVolume" "hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-')" { submap_universal = true; })
                (mkBind "XF86AudioRaiseVolume" "hl.dsp.exec_cmd('wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+')" { submap_universal = true; })
                (mkBind "XF86AudioMute" "hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_SINK@ toggle')" { submap_universal = true; })
                (mkBind "XF86MonBrightnessDown" "hl.dsp.exec_cmd('brightnessctl set 1%-')" { submap_universal = true; })
                (mkBind "XF86MonBrightnessUp" "hl.dsp.exec_cmd('brightnessctl set 1%+')" { submap_universal = true; })
                (mkBind "SUPER + H" "hl.dsp.focus({ direction = 'l' })" {})
                (mkBind "SUPER + J" "hl.dsp.focus({ direction = 'd' })" {})
                (mkBind "SUPER + K" "hl.dsp.focus({ direction = 'u' })" {})
                (mkBind "SUPER + L" "hl.dsp.focus({ direction = 'r' })" {})
                (mkBind "SUPER + SHIFT + H" "hl.dsp.window.move({ direction = 'l' })" {})
                (mkBind "SUPER + SHIFT + J" "hl.dsp.window.move({ direction = 'd' })" {})
                (mkBind "SUPER + SHIFT + K" "hl.dsp.window.move({ direction = 'u' })" {})
                (mkBind "SUPER + SHIFT + L" "hl.dsp.window.move({ direction = 'r' })" {})
                (mkBind "SUPER + Q" "hl.dsp.window.close()" { release = true; submap_universal = true; })
                (mkBind "SUPER + S" "hl.dsp.exec_cmd('systemctl suspend')" { locked = true; release = true; submap_universal = true; })
                (mkBind "SUPER + F" "hl.dsp.window.fullscreen({ mode = 'maximized' })" {})
                (mkBind "SUPER + T" ''
                    function()
                        local current_layout = hl.get_config("general.layout")
                        if current_layout == "dwindle" then
                            hl.config({ general = { layout = "scrolling" } })
                            hl.dispatch(hl.dsp.submap("scrolling"))
                        elseif current_layout == "scrolling" then
                            hl.config({ general = { layout = "dwindle" } })
                            hl.dispatch(hl.dsp.submap("reset"))
                        end
                    end
                '' { submap_universal = true; })
                (mkBind "SUPER + W" ''
                    function()
                        local time = os.date("%m/%d (%a) %R")
                        hl.notification.create({
                            text = "🕓️ "..time,
                            duration = 3000,
                            font_size = 24,
                            color = "rgb(5294e2)",
                            icon = "NONE",
                        })
                    end
                '' { submap_universal = true; })
            ];
            define_submap = {
                _args = [
                    "scrolling"
                    (lib.generators.mkLuaInline ''
                        function()
                            hl.bind("SUPER + H", hl.dsp.layout("focus l"))
                            hl.bind("SUPER + L", hl.dsp.layout("focus r"))
                            hl.bind("SUPER + SHIFT + H", hl.dsp.layout("swapcol l"))
                            hl.bind("SUPER + SHIFT + L", hl.dsp.layout("swapcol r"))
                            hl.bind("SUPER + F", hl.dsp.layout("colresize +conf"))
                        end
                    '')
                ];
            };
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
            window_rule = [{
                match.fullscreen = true;
                no_shadow = true;
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
            on = {
                _args = [
                    "config.reloaded"
                    (lib.generators.mkLuaInline ''
                        function()
                            hl.timer(function()
                                hl.dispatch(hl.dsp.submap("reset"))
                            end, { timeout = 100, type = "oneshot" })
                        end
                    '')
                ];
            };
        };
    };
}
