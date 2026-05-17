{ ... }: {
    services = {
        cliphist.enable = true;
        playerctld.enable = true;
        syshud = {
            enable = true;
            settings = {
                position = "top";
                timeout = 1;
                transition-time = 250;
            };
        };
    };
}

