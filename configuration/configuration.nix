{
  imports = [
    ./modules/fonts.nix
    ./modules/hardware-configuration.nix
    ./modules/locale.nix
    ./modules/networking.nix
    ./modules/programs.nix
    ./modules/security.nix
    ./modules/services.nix
    ./modules/user.nix
  ];
  documentation.nixos.enable = false;
  environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://nix-community.cachix.org"
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      (final: prev: {
        mozc = prev.mozc.overrideAttrs (old: {
          postPatch = (old.postPatch or "") + ''
            find src/gui -name '*.ui' -exec sed -i 's|::mozc::|mozc::|g' {} +
          '';
        });
      })
    ];
  };
  system.stateVersion = "26.11";
}
