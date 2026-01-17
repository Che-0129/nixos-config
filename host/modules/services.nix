{ pkgs, ... }:

{
    services = {
        gvfs.enable = true;
        udisks2.enable = true;
        userborn.enable = true;
        pipewire = {
            enable = true;
            pulse.enable = true;
            wireplumber.enable = true;
        };
        udev.packages = [ pkgs.qmk-udev-rules ];
    };
}
