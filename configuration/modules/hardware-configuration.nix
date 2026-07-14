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
    swapDevices = [{
        device = "/swapfile";
        priority = 10;
        size = 4096;
    }];
    zramSwap = {
        enable = true;
        memoryPercent = 100;
        priority = 100;
    };
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
