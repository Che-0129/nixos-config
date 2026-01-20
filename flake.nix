{
    description = "NixOS + Hyprland";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        hyprland.url = "github:hyprwm/Hyprland";
        hyprland-plugins = {
            url = "github:hyprwm/hyprland-plugins";
            inputs.hyprland.follows = "hyprland";
        };
        nixvim.url = "github:nix-community/nixvim";
        modes-nvim = {
            url = "github:mvllow/modes.nvim";
            flake = false;
        };
    };

    outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    {
        nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./host/configuration.nix
                home-manager.nixosModules.home-manager
                {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        backupFileExtension = "hm-backup";
                        extraSpecialArgs = { inherit inputs; };
                        users.che = ./home/home-manager.nix;
                    };
                }
            ];
        };
    };
}
