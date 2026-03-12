{ pkgs, ... }:

{
    home.packages = [ pkgs.nixos-artwork.wallpapers.simple-blue ];
    services.hyprpaper = {
        enable = true;
        settings = {
            splash = false;
            wallpaper = [
                {
                    monitor = "";
                    path = "${pkgs.nixos-artwork.wallpapers.simple-blue}/share/backgrounds/nixos/nix-wallpaper-simple-blue.png";
                }
            ];
        };
    };
}
