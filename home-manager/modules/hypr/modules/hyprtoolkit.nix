{ inputs, pkgs, ... }: {
    programs.hyprtoolkit = {
        enable = true;
        package = inputs.hyprtoolkit.packages.${pkgs.stdenv.hostPlatform.system}.hyprtoolkit;
        settings = {
            background = "0xFF383C4A";
            accent = "0xFF5294E2";
            font_size = 14;
            icon_theme = "Adwaita";
            font_family = "Noto Sans CJK JP";
            font_family_monospace = "Moralerspace Neon HW";
        };
    };
}
