{ config, pkgs, ... }:

{
    gtk = {
        enable = true;
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
