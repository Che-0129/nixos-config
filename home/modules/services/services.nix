{ ... }:

{
    imports = [
        ./modules/mako.nix
        ./modules/swayidle.nix
    ];

    services = {
        cliphist.enable = true;
        lxqt-policykit-agent.enable = true;
    };
}
