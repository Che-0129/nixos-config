{ pkgs, ... }:

{
    services.swayidle = {
        enable = true;
        extraArgs = [ "-w" ];
        events = [
            { event = "before-sleep"; command = "${pkgs.systemd}/bin/loginctl lock-session"; }
            { event = "after-resume"; command = "/etc/profiles/per-user/$USER/bin/mmsg -d enable_monitor,eDP-1"; }
            { event = "lock"; command = "${pkgs.procps}/bin/pidof swaylock || ${pkgs.playerctl}/bin/playerctl pause ; ${pkgs.swaylock-effects}/bin/swaylock"; }
        ];
        timeouts = [
            { timeout = 530; command = "${pkgs.brightnessctl}/bin/brightnessctl -s set 10"; resumeCommand = "${pkgs.brightnessctl}/bin/brightnessctl -r"; }
            { timeout = 600; command = "${pkgs.systemd}/bin/loginctl lock-session"; }
            { timeout = 630; command = "/etc/profiles/per-user/$USER/bin/mmsg -d disable_monitor,eDP-1"; resumeCommand = "/etc/profiles/per-user/$USER/bin/mmsg -d enable_monitor,eDP-1"; }
            { timeout = 720; command = "${pkgs.systemd}/bin/systemctl suspend"; }
        ];
    };
}
