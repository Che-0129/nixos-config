{
    inputs = {
        home-manager.url = "github:nix-community/home-manager";
        nixpkgs.url = "nixpkgs/nixos-unstable";
        nixvim.url = "github:nix-community/nixvim";
    };
    outputs = { home-manager, nixpkgs, nixvim, ... }: {
        nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem {
            modules = [
                ./configuration/configuration.nix
                home-manager.nixosModules.home-manager {
                    home-manager = {
                        backupFileExtension = "hm-backup";
                        extraSpecialArgs = { inherit nixvim; };
                        useGlobalPkgs = true;
                        users.che = ./home-manager/home-manager.nix;
                        useUserPackages = true;
                    };
                }
            ];
            system = "x86_64-linux";
        };
    };
}
