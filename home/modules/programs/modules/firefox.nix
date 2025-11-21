{ config, pkgs, ... }:

{
    programs.firefox = {
        enable = true;
        languagePacks = [ "ja" ];
        profiles.che = {
            settings = {
                "browser.toolbars.bookmarks.visibility" = "never";
                "browser.tabs.closeWindowWithLastTab" = false;
                "font.name.sans-serif.ja" = "Noto Sans CJK JP";
                "sidebar.main.tools" = null;
                "sidebar.verticalTabs" = true;
                "ui.key.menuAccessKeyFocuses" = false;
            };
        };
        policies.RequestedLocales = [ "ja" ];
    };
}
