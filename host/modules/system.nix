{ ... }:

{
    boot = {
        initrd.systemd.enable = true;
        loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };
    };

    fileSystems."/".options = [ "compress=zstd:1" "noatime" "space_cache=v2" ];

    zramSwap = {
        enable = true;
        priority = 100;
    };

    swapDevices = [{
        device = "/swapfile";
        size = 4096;
        priority = 10;
    }];

    networking = {
        hostName = "NixOS";
        networkmanager = {
            enable = true;
            wifi.backend = "iwd";
        };
    };

    system = {
        etc.overlay.enable = true;
        nixos-init.enable = true;
    };
}
