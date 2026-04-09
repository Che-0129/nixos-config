{ ... }: {
    networking = {
        dhcpcd.enable = false;
        hostName = "NixOS";
        useNetworkd = true;
        wireless.iwd = {
            enable = true;
            settings = {
                General.EnableNetworkConfiguration = true;
                Network.NameResolvingService = "systemd";
            };
        };
    };
    systemd.network.enable = true;
}
