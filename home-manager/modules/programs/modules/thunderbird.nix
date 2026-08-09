{ ... }: {
    programs.thunderbird = {
        enable = true;
        languagePacks = [ "ja" ];
        policies.ExtensionSettings."arc@dark" = {
            install_url = "https://addons.thunderbird.net/thunderbird/downloads/latest/arc-x-dark/latest.xpi";
            installation_mode = "normal_installed";
        };
        profiles.che = {
            isDefault = true;
            settings."font.name.sans-serif.ja" = "Noto Sans CJK JP";
        };
    };
}
