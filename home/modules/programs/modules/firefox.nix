{ ... }:

{
    programs.firefox = {
        enable = true;
        languagePacks = [ "ja" ];
        profiles.che.settings = {
            "browser.tabs.closeWindowWithLastTab" = false;
            "browser.toolbars.bookmarks.visibility" = "never";
            "browser.uiCustomization.state" = {
                placements = {
                    widget-overflow-fixed-list = [];
                    unified-extensions-area = [];
                    nav-bar = [
                        "sidebar-button"
                        "back-button"
                        "forward-button"
                        "stop-reload-button"
                        "customizableui-special-spring4"
                        "urlbar-container"
                        "customizableui-special-spring3"
                        "vertical-spacer"
                        "unified-extensions-button"
                    ];
                    toolbar-menubar = [ "menubar-items" ];
                    TabsToolbar = [];
                    vertical-tabs = [ "tabbrowser-tabs" ];
                    PersonalToolbar = [
                        "import-button"
                        "personal-bookmarks"
                    ];
                };
                seen = [
                    "developer-button"
                    "screenshot-button"
                ];
                dirtyAreaCache = [
                    "nav-bar"
                    "TabsToolbar"
                    "vertical-tabs"
                    "PersonalToolbar"
                    "toolbar-menubar"
                ];
                currentVersion = 23;
                newElementCount = 10;
            };
            "font.name.sans-serif.ja" = "Noto Sans CJK JP";
            "intl.locale.requested" = "ja";
            "sidebar.main.tools" = null;
            "sidebar.verticalTabs" = true;
            "ui.key.menuAccessKeyFocuses" = false;
        };
    };
}
