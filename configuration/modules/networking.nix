{ ... }: {
    networking = {
        hostName = "NixOS";
        useNetworkd = true;
        wireless.iwd = {
            enable = true;
            settings = {
                Network.EnableIPv6 = true;
                Settings.AutoConnect = true;
            };
        };
    };
    systemd.network = {
        enable = true;
        networks."40-wlan" = {
            matchConfig.Name = "wlan0";
            networkConfig = {
                DHCP = "yes";
                IPv6AcceptRA = true;
            };
        };
    };
}
