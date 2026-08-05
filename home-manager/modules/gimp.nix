{ pkgs, ... }: {
    home = {
        packages = [ pkgs.gimp ];
        file.".config/GIMP/3.2/gimprc".text = ''
            (toolbox-wilber no)
            (toolbox-groups no)
            (theme "System")
            (show-welcome-dialog no)
        '';
    };
    xdg.desktopEntries."gimp" = {
        exec = "gimp -c %U";
        icon = "gimp";
        name = "GIMP";
    };
}
