{ pkgs, ... }: {
    home = {
        packages = [ pkgs.gimp ];
        file.".config/GIMP/3.0/gimprc".text = ''
            (toolbox-wilber no)
            (toolbox-groups no)
            (theme "System")
            (show-welcome-dialog no)
        '';
    };
    xdg.desktopEntries."gimp" = {
        exec = "gimp -c %U";
        icon = "${pkgs.gimp}/share/icons/hicolor/scalable/apps/gimp.svg";
        name = "GIMP";
    };
}
