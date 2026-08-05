{
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager = {
            inputs.nixpkgs.follows = "nixpkgs";
            url = "github:nix-community/home-manager";
        };
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
    outputs = { nixpkgs, home-manager, hyprtoolkit, hyprlauncher, nixvim, disko, ... }: {
        nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./configuration/configuration.nix
                ./disko.nix
                disko.nixosModules.disko
                home-manager.nixosModules.home-manager {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        users.che = ./home-manager/home-manager.nix;
                        extraSpecialArgs = { inherit hyprtoolkit hyprlauncher nixvim; };
                        backupFileExtension = "hm-backup";
                    };
                }
            ];
        };
    };
}
