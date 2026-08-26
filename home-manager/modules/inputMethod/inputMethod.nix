{ pkgs, ... }: {
    i18n.inputMethod = {
        enable = true;
        fcitx5 = {
            addons = with pkgs; [
                (callPackage ./fcitx5-arc-dark-theme.nix {})
                fcitx5-mozc-ut
            ];
            settings = {
                globalOptions = {
                    Hotkey.TriggerKeys = "";
                    "Hotkey/ActivateKeys"."0" = "Hangul";
                    "Hotkey/DeactivateKeys"."0" = "Hangul_Hanja";
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
        type = "fcitx5";
    };
    home.file.".config/mozc/config1.db".source = ./config1.db;
}
