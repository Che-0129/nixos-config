{ ... }:

{
    programs.firefox = {
        enable = true;
        languagePacks = [ "ja" ];
        policies.ExtensionSettings."enhancerforyoutube@maximerf.addons.mozilla.org" = {
            installation_mode = "normal_installed";
            install_url = "https://www.mrfdev.com/downloads/enhancer_for_youtube-2.0.130.1.xpi";
            updates_disabled = false;
        };
        profiles.che = {
            settings = {
                "browser.tabs.closeWindowWithLastTab" = false;
                "browser.toolbars.bookmarks.visibility" = "never";
                "browser.translations.enable" = false;
                "browser.urlbar.suggest" = false;
                "browser.urlbar.suggest.topsites" = false;
                "browser.urlbar.trimURLs" = false;
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
#star-button-box { display: none !important }
            '';
            userContent = ''
menu.personalizeButtonWrapper { display: none !important }
            '';
        };
    };
}
