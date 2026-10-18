{
  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    hyprosd = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:Che-0129/hyprosd";
    };
    hyprfm4 = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:Che-0129/hyprfm4";
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
