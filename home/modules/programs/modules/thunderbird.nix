{ pkgs, ... }:

{
    programs.thunderbird = {
        enable = true;
        package = pkgs.thunderbird.override {
            extraPolicies.ExtensionSettings."langpack-ja@thunderbird.mozilla.org" = {
                installation_mode = "normal_installed";
                install_url = "https://addons.thunderbird.net/thunderbird/downloads/file/1042638/japanese_ja_language_pack-145.0.20251112.194829-tb.xpi?src=";
                updates_disabled = false;
            };
        };
        profiles.default = {
            isDefault = true;
            settings = {
                "font.name.sans-serif.ja" = "Noto Sans CJK JP";
                "intl.locale.requested" = "ja";
            };
        };
    };
}
