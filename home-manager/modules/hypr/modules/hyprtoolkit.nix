{ pkgs, ... }: {
    home.packages = [ pkgs.hyprtoolkit ];
    xdg.configFile."hypr/hyprtoolkit.conf".text = ''
        background = rgba(383c4ae6)
        accent = rgb(5294e2)
        icon_theme = Adwaita
        font_family = Noto Sans CJK JP
        font_family_monospace = Moralerspace Neon HW
    '';
}
