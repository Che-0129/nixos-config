{ inputs, pkgs, ... }: {
    services.hyprlauncher = {
        enable = true;
        package = inputs.hyprlauncher.packages.${pkgs.stdenv.hostPlatform.system}.hyprlauncher;
        settings = {
            general.show_apps_on_open = true;
            ui.window_size = "600 400";
        };
    };
    xdg.desktopEntries = {
        "nvim" = {
            name = "Neovim";
            noDisplay = true;
        };
        "yazi" = {
            name = "Yazi File Manager";
            noDisplay = true;
        };
    };
}
