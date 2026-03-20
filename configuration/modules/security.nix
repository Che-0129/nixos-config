{ ... }: {
    security = {
        pam.services.hyprlock = {};
        sudo.wheelNeedsPassword = false;
    };
}
