{ pkgs, ... }: {
    services = {
        pipewire = {
            enable = true;
            pulse.enable = true;
            wireplumber.enable = true;
        };
        udev.packages = [ pkgs.qmk-udev-rules ];
    };
}
