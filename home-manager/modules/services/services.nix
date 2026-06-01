{ ... }: {
    imports = [ ./modules/syshud.nix ];
    services = {
        cliphist = {
            enable = true;
            allowImages = false;
        };
        playerctld.enable = true;
    };
}

