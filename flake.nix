{
    description = "NixOS + Hyprland";
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        nixvim.url = "github:nix-community/nixvim";
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
