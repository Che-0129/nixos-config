{ pkgs, ... }: {
    gtk = {
        enable = true;
        font.name = "Noto Sans CJK JP";
        iconTheme = {
            name = "Arc";
            package = pkgs.arc-icon-theme;
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
