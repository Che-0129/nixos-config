{ config, lib, modulesPath, pkgs, ... }: {
    imports = [(modulesPath + "/installer/scan/not-detected.nix")];
    boot = {
        initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod" ];
        kernel.sysctl."kernel.sysrq" = 1;
        kernelModules = [ "kvm-amd" ];
        kernelPackages = pkgs.linuxPackages_zen;
        loader = {
            efi.canTouchEfiVariables = true;
            systemd-boot.enable = true;
        };
    };
    fileSystems."/" = {
        device = "/dev/disk/by-label/nixos-root";
        fsType = "btrfs";
        options = [ "compress=zstd:1" "noatime" "space_cache=v2" ];
    };
    fileSystems."/boot" = {
        device = "/dev/disk/by-label/nixos-boot";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
    };
    swapDevices = [{
        device = "/swapfile";
        priority = 10;
        size = 4096;
    }];
    zramSwap = {
        enable = true;
        priority = 100;
    };
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
