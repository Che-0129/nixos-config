{ pkgs, ... }: {
    boot = {
        kernelPackages = pkgs.linuxPackages_zen;
        loader = {
            efi.canTouchEfiVariables = true;
            systemd-boot.enable = true;
        };
    };
    fileSystems."/".options = [ "compress=zstd:1" "noatime" "space_cache=v2" ];
    swapDevices = [{
        device = "/swapfile";
        priority = 10;
        size = 4096;
    }];
    zramSwap = {
        enable = true;
        priority = 100;
    };
}
