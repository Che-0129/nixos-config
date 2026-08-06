{ hyprlauncher, pkgs, ... }: {
    services.hyprlauncher = {
        enable = true;
        package = hyprlauncher.packages.${pkgs.stdenv.hostPlatform.system}.hyprlauncher;
        settings.ui.window_size = "600 400";
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
