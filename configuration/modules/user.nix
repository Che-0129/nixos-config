{ pkgs, ... }: {
    users = {
        mutableUsers = false;
        users.che = {
            extraGroups = [ "wheel" ];
            hashedPassword = "$y$j9T$/vTrkHqfzLnpsiYGQxPf./$.wxK9KBYWtl5ksaJRihW3LYBWvyvhI7sEgE2TiqLa9/";
            isNormalUser = true;
            shell = pkgs.fish;
        };
    };
}
