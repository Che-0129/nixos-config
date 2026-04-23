{ ... }: {
    programs.firefox = {
        enable = true;
        languagePacks = [ "ja" ];
        policies.RequestedLocales = [ "ja" ];
        profiles.che = {
            isDefault = true;
            search = {
                default = "ddg";
                force = true;
                engines = {
                    bing.metaData.hidden = true;
                    duckduckgo.metaData.hidden = true;
                    perplexity.metaData.hidden = true;
                    rakuten.metaData.hidden = true;
                    wikipedia-ja.metaData.hidden = true;
                    yahoo-jp.metaData.hidden = true;
                    yahoo-jp-auctions.metaData.hidden = true;
                };
            };
            settings = {
                "browser.ai.control.sidebarChatbot" = "blocked";
                "browser.newtabpage.activity-stream.showSponsored" = false;
                "browser.tabs.closeWindowWithLastTab" = false;
                "browser.toolbars.bookmarks.visibility" = "never";
                "browser.uiCustomization.navBarWhenVerticalTabs" = [
                    "urlbar-container"
                    "downloads-button"
                ];
                "browser.urlbar.suggest" = false;
                "browser.urlbar.trimURLs" = false;
                "browser.quitShortcut.disabled" = true;
                "devtools.toolbox.host" = "right";
                "font.name.sans-serif.ja" = "Noto Sans CJK JP";
                "intl.locale.requested" = "ja";
                "sidebar.main.tools" = null;
                "sidebar.verticalTabs" = true;
                "sidebar.visibility" = "never";
                "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
                "ui.key.menuAccessKeyFocuses" = false;
            };
            userChrome = ''
                .buttons-wrapper { min-height: 0 !important; }
                #back-button,
                #forward-button,
                #identity-permission-box,
                #picture-in-picture-button,
                #reader-mode-button,
                #sidebar-button,
                #star-button-box,
                #trust-icon-container,
                #unified-extensions-button,
                #vertical-spacer {
                    display: none !important;
                }
            '';
            userContent = ''.personalizeButtonWrapper { display: none; }'';
        };
    };
}
