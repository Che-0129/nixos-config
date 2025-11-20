{
    description = "NixOS + MangoWC";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        flake-parts.url = "github:hercules-ci/flake-parts";
        mango = {
            url = "github:DreamMaoMao/mangowc";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs =
        inputs@{ self, flake-parts, ... }:
        flake-parts.lib.mkFlake { inherit inputs; } {
        systems = [ "x86_64-linux" ];
            flake = {
                nixosConfigurations = {
                    NixOS = inputs.nixpkgs.lib.nixosSystem {
                        system = "x86_64-linux";
                        specialArgs = { inherit inputs; };
                        modules = [
                        ./host/configuration.nix
                        inputs.home-manager.nixosModules.home-manager
                        {
                            home-manager = {
                                useGlobalPkgs = true;
                                useUserPackages = true;
                                backupFileExtension = "hm-backup";
                                extraSpecialArgs = { inherit inputs; };
                                users.che = ./home/home-manager.nix;
                            };
                        }
                        inputs.mango.nixosModules.mango
                        {
                            programs.mango.enable = true;
                        }
                        ];
                    };
                };
            };
        };
}
