{ ... }: {
    programs.thunderbird = {
        enable = true;
        languagePacks = [ "ja" ];
        profiles.che = {
            isDefault = true;
            settings."font.name.sans-serif.ja" = "Noto Sans CJK JP";
        };
    };
}
