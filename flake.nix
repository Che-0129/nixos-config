{
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        nixvim.url = "github:nix-community/nixvim";
    };
    outputs = { nixpkgs, home-manager, nixvim, ... }: {
        nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./configuration/configuration.nix
                home-manager.nixosModules.home-manager {
                    home-manager = {
                        users.che = ./home-manager/home-manager.nix;
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        extraSpecialArgs = { inherit nixvim; };
                    };
                }
            ];
        };
    };
}
