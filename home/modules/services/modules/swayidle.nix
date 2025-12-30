{ inputs, lib, pkgs, ... }:

{
    services.swayidle = {
        enable = true;
        extraArgs = [ "-w" ];
        events = {
            before-sleep = "${lib.getExe' pkgs.systemd "loginctl"} lock-session";
            after-resume = "${lib.getExe' inputs.mango.packages.${pkgs.stdenv.hostPlatform.system}.default "mmsg"} -d enable_monitor";
            lock = "${lib.getExe' pkgs.procps "pidof"} swaylock || ${lib.getExe pkgs.playerctl} pause ; ${lib.getExe pkgs.swaylock-effects}";
        };
        timeouts = [
            { timeout = 530; command = "${lib.getExe pkgs.brightnessctl} -s set 10"; resumeCommand = "${lib.getExe pkgs.brightnessctl} -r"; }
            { timeout = 600; command = "${lib.getExe' pkgs.systemd "loginctl"} lock-session"; }
            { timeout = 630; command = "${lib.getExe' inputs.mango.packages.${pkgs.stdenv.hostPlatform.system}.default "mmsg"} -d disable_monitor"; resumeCommand = "${lib.getExe' inputs.mango.packages.${pkgs.stdenv.hostPlatform.system}.default "mmsg"} -d enable_monitor"; }
            { timeout = 720; command = "${lib.getExe' pkgs.systemd "systemctl"} suspend"; }
        ];
    };
}
