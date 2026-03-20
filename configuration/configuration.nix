{ ... }: {
    imports = [
        ./hardware-configuration.nix
        ./modules/fonts.nix
        ./modules/hardware.nix
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
    };
    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "26.05";
}
