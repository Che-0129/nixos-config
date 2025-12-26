{ ... }:

{
    imports = [
        ./modules/mako.nix
        ./modules/swayidle.nix
    ];

    services = {
        cliphist.enable = true;
        playerctld.enable = true;
    };
}
