{ config, pkgs, inputs, ... }:

{
    i18n.inputMethod = {
        enable = true;
        type = "fcitx5";
        fcitx5 = {
            addons = with pkgs; [
                fcitx5-mozc-ut
                (pkgs.callPackage ./fcitx5-arc-theme.nix {})
            ];
            settings = {
                globalOptions = {
                    Hotkey = {
                        TriggerKeys = "";
                    };
                    "Hotkey/ActivateKeys" = {
                        "0" = "Henkan";
                    };
                    "Hotkey/DeactivateKeys" = {
                        "0" = "Muhenkan";
                    };
                };
                addons.classicui.globalSection = {
                    Font = "Noto Sans CJK JP 10";
                    MenuFont = "Noto Sans CJK JP 10";
                    TrayFont = "Noto Sans CJK JP Bold 10";
                    Theme = "Arc-Dark";
                };
                inputMethod = {
                    "Groups/0" = {
                        Name = "Default";
                        "Default Layout" = "jp";
                        DefaultIM = "mozc";
                    };
                    "Groups/0/Items/0" = {
                        Name = "keyboard-jp";
                        Layout = "";
                    };
                    "Groups/0/Items/1" = {
                        Name = "mozc";
                        Layout =  "";
                    };
                    GroupOrder."0" = "Default";
                };
            };
            waylandFrontend = true;
        };
    };
}
