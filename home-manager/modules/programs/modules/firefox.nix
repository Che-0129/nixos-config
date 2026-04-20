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
                    "back-button"
                    "forward-button"
                    "stop-reload-button"
                    "customizableui-special-spring4"
                    "urlbar-container"
                    "customizableui-special-spring3"
                    "vertical-spacer"
                    "downloads-button"
                ];
                "browser.uiCustomization.state" = {
                    placements = {
                        widget-overflow-fixed-list = [];
                        unified-extensions-area = [];
                        nav-bar = [
                            "back-button"
                            "forward-button"
                            "stop-reload-button"
                            "customizableui-special-spring4"
                            "urlbar-container"
                            "customizableui-special-spring3"
                            "vertical-spacer"
                            "downloads-button"
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
                        "jid1-zsmfwe4lcaw9oq_jetpack-browser-action"
                        "_9350bc42-47fb-4598-ae0f-825e3dd9ceba_-browser-action"
                        "enhancerforyoutube_maximerf_addons_mozilla_org-browser-action"
                        "ublock0_raymondhill_net-browser-action"
                        "x-dim-mode_juanbuis_com-browser-action"
                    ];
                    dirtyAreaCache = [
                        "nav-bar"
                        "TabsToolbar"
                        "vertical-tabs"
                        "PersonalToolbar"
                        "toolbar-menubar"
                        "unified-extensions-area"
                    ];
                    currentVersion = 23;
                    newElementCount = 13;
                };
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
                moz-button[view="viewCustomizeSidebar"] {
                    visibility: hidden;
                }
                #identity-permission-box,
                #picture-in-picture-button,
                #star-button-box,
                #trust-icon-container,
                #reader-mode-button {
                    display: none !important;
                }
            '';
            userContent = ''.personalizeButtonWrapper { display: none; }'';
        };
    };
}
