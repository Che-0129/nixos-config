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
}
