{ ... }: {
    services.hyprlauncher = {
        enable = true;
        settings = {
            finders.desktop_icons = true;
            ui.window_size = "600 400";
        };
    };
}
