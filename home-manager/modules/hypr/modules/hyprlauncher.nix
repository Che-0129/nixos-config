{ ... }: {
    services.hyprlauncher = {
        enable = true;
        settings = {
            finders.desktop_icons = false;
            ui.window_size = "600 400";
        };
    };
}
