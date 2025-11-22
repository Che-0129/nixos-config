{ ... }:

{
    programs.firefox = {
        enable = true;
        languagePacks = [ "ja" ];
        profiles.che.settings = {
            "browser.tabs.closeWindowWithLastTab" = false;
            "browser.toolbars.bookmarks.visibility" = "never";
            "font.name.sans-serif.ja" = "Noto Sans CJK JP";
            "intl.locale.requested" = "ja";
            "sidebar.main.tools" = null;
            "sidebar.verticalTabs" = true;
            "ui.key.menuAccessKeyFocuses" = false;
        };
    };
}
