{ ... }: {
    networking = {
        hostName = "NixOS";
        networkmanager = {
            enable = true;
            wifi.backend = "iwd";
        };
    };
}
