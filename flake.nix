{
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        nixvim.url = "github:nix-community/nixvim";
        disko.url = "github:nix-community/disko";
    };
    outputs = { nixpkgs, home-manager, nixvim, disko, ... }: {
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
                        extraSpecialArgs = { inherit nixvim; };
                        backupFileExtension = "hm-backup";
                    };
                }
            ];
        };
    };
}
