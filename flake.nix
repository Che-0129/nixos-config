{
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager = {
            inputs.nixpkgs.follows = "nixpkgs";
            url = "github:nix-community/home-manager";
        };
        hyprland.url = "github:hyprwm/Hyprland";
        hyprtoolkit.url = "github:hyprwm/hyprtoolkit";
        hyprlauncher = {
            inputs.hyprtoolkit.follows = "hyprtoolkit";
            url = "github:hyprwm/hyprlauncher";
        };
        nixvim = {
            inputs.nixpkgs.follows = "nixpkgs";
            url = "github:nix-community/nixvim";
        };
        disko = {
            inputs.nixpkgs.follows = "nixpkgs";
            url = "github:nix-community/disko";
        };
    };
    outputs = inputs: {
        nixosConfigurations.NixOS = inputs.nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./configuration/configuration.nix
                ./disko.nix
                inputs.disko.nixosModules.disko
                inputs.home-manager.nixosModules.home-manager {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        users.che = ./home-manager/home-manager.nix;
                        extraSpecialArgs = { inherit inputs; };
                        backupFileExtension = "hm-backup";
                    };
                }
            ];
        };
    };
}
