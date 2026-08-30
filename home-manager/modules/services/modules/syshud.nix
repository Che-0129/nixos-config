{ pkgs, ... }: {
    services.syshud = {
        enable = true;
        package = pkgs.callPackage ./syshud-fork.nix {};
        settings = {
            position = "top";
            timeout = 1;
            transition-time = 250;
        };
    };
    home.file.".config/sys64/hud/style.css".text = ''
        #syshud .box_layout { background: #313742; }
        #syshud label { color: @theme_fg_color; }
        #syshud scale trough {
            border-radius: 4px;
            opacity: 1.0;
        }
        #syshud scale slider { border: none; }
        #syshud scale highlight {
            background: #5294e2;
            border: none;
        }
        #syshud .muted scale highlight { background: transparent; }
        #syshud .muted label { color: alpha(@theme_fg_color, 0.5); }
    '';
    systemd.user.services.syshud.Service.Environment = [
        "GTK_ICON_THEME=Adwaita"
        "XDG_DATA_DIRS=/run/current-system/sw/share"
    ];
}
