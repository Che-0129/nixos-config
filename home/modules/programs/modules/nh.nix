{ ... }:

{
    programs.nh = {
        enable = true;
        clean = {
            enable = true;
            extraArgs = "--keep-since 3d --keep 3";
        };
        osFlake = "/home/che/.nixos-config";
    };
}
