{ pkgs, ... }: {
    gtk = {
        enable = true;
        colorScheme = "dark";
        font.name = "Noto Sans CJK JP";
        iconTheme = {
            name = "Adwaita";
            package = pkgs.adwaita-icon-theme;
        };
        theme = {
            name = "Arc-Dark";
            package = pkgs.arc-theme;
        };
    };
    home.pointerCursor = {
        enable = true;
        hyprcursor.enable = true;
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
        size = 24;
    };
    qt = {
        enable = true;
        platformTheme.name = "gtk3";
    };
}
