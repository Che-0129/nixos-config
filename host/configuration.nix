{ pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ./modules/fonts.nix
        ./modules/programs.nix
        ./modules/services.nix
        ./modules/system.nix
    ];

    time.timeZone = "Asia/Tokyo";
    i18n.defaultLocale = "ja_JP.UTF-8";
    console.keyMap = "jp106";

    environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];

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
        pam.services.hyprlock = {};
    };

    nix = {
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 3d";
        };
        settings = {
            auto-optimise-store = true;
            experimental-features = [ "nix-command" "flakes" ];
            substituters = ["https://hyprland.cachix.org"];
            trusted-substituters = ["https://hyprland.cachix.org"];
            trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
        };
    };

    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "26.05";
}
