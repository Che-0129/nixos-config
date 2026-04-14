{ pkgs, ... }: {
    programs.thunderbird = {
        enable = true;
        package = pkgs.thunderbird.override {
            extraPolicies.ExtensionSettings."langpack-ja@thunderbird.mozilla.org" = {
                installation_mode = "normal_installed";
                install_url = "https://addons.thunderbird.net/thunderbird/downloads/file/1044734/japanese_ja_language_pack-148.0.20260219.215726-tb.xpi";
                updates_disabled = false;
            };
        };
        profiles.che = {
            isDefault = true;
            settings = {
                "font.name.sans-serif.ja" = "Noto Sans CJK JP";
                "intl.locale.requested" = "ja";
            };
        };
    };
}
