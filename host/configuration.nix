{ config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ./modules/pkgs.nix
        ./modules/programs.nix
        ./modules/services.nix
        ./modules/system.nix
    ];

    time.timeZone = "Asia/Tokyo";
    i18n.defaultLocale = "ja_JP.UTF-8";
    console.keyMap = "jp106";

    users = {
        mutableUsers = false;
        users.che = {
            isNormalUser = true;
            extraGroups = [ "adbusers" "networkmanager" "wheel" ];
            shell = pkgs.fish;
            hashedPassword = "$y$j9T$/vTrkHqfzLnpsiYGQxPf./$.wxK9KBYWtl5ksaJRihW3LYBWvyvhI7sEgE2TiqLa9/";
        };
    };

    security = {
        sudo-rs = {
            enable = true;
            wheelNeedsPassword = false;
        };
        pam.services.swaylock = {};
    };

    nix = {
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 7d";
        };
        settings = {
            auto-optimise-store = true;
            experimental-features = [ "nix-command" "flakes" ];
        };
    };

    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "25.11";
}
