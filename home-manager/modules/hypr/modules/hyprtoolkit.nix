{ inputs, pkgs, ... }: {
    home = {
        packages = [ inputs.hyprtoolkit.packages.${pkgs.stdenv.hostPlatform.system}.hyprtoolkit ];
        file.".config/hypr/hyprtoolkit.conf".text = ''
            background = rgb(383c4a)
            accent = rgb(5294e2)
            font_size = 14
            icon_theme = Adwaita
            font_family = Noto Sans CJK JP
            font_family_monospace = Moralerspace Neon HW
        '';
    };
}
