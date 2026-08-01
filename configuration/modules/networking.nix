{ ... }: {
    networking = {
        hostName = "NixOS";
        wireless.iwd = {
            enable = true;
            settings = {
                Network.EnableIPv6 = true;
                Settings.AutoConnect = true;
            };
        };
    };
}
