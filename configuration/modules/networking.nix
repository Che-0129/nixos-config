{ ... }: {
    networking = {
        dhcpcd.enable = false;
        hostName = "NixOS";
        useNetworkd = true;
        wireless.iwd.enable = true;
    };
}
