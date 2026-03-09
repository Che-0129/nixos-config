{ pkgs, ... }:

{
    gtk = {
        enable = true;
        font.name = "Noto Sans CJK JP";
        theme = {
            name = "Arc-Dark";
            package = pkgs.arc-theme;
        };
        iconTheme = {
            name = "Arc";
            package = pkgs.arc-icon-theme;
        };
    };
    home.pointerCursor = {
        enable = true;
        package = pkgs.adwaita-icon-theme;
        hyprcursor.enable = true;
        name = "Adwaita";
        size = 24;
    };
    qt = {
        enable = true;
        platformTheme.name = "gtk3";
    };
}
