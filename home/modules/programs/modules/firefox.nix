{ config, pkgs, ... }:

{
    programs.firefox = {
        enable = true;
        languagePacks = [ "ja" ];
        profiles.che = {
            bookmarks = {};
            settings = {
                "sidebar.verticalTabs" = true;
            };
        };
    };
}
