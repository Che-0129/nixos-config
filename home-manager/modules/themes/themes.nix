{ pkgs, ... }: {
    gtk = {
        enable = true;
        colorScheme = "dark";
        font.name = "Noto Sans CJK JP";
        iconTheme = {
            name = "Arc";
            package = pkgs.arc-icon-theme;
        };
        theme = {
            name = "Arc-Dark";
            package = (pkgs.callPackage ./arc-dark-theme.nix {});
        };
    };
    home.pointerCursor = {
        enable = true;
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
        size = 24;
    };
    qt = {
        enable = true;
        platformTheme.name = "gtk3";
    };
}
