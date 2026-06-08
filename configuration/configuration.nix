{ ... }: {
    imports = [
        ./modules/fonts.nix
        ./modules/hardware-configuration.nix
        ./modules/locale.nix
        ./modules/networking.nix
        ./modules/programs.nix
        ./modules/security.nix
        ./modules/services.nix
        ./modules/user.nix
    ];
    environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];
    nix.settings = {
        auto-optimise-store = true;
        experimental-features = [ "nix-command" "flakes" ];
        substituters = [ "https://nix-community.cachix.org" ];
        trusted-public-keys = [ "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
    };
    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "26.11";
}
