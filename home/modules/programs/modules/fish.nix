{ ... }:

{
    programs.fish = {
        enable = true;
        loginShellInit = ''
            if uwsm check may-start
                exec uwsm start mango-uwsm.desktop
            end
        '';
        shellAliases = {
            dl = "cd ~/Downloads";
            sp = "systemctl suspend";
            rb = "systemctl reboot";
            sd = "systemctl poweroff";
            rm = "trash-put";
            ls = "eza --icons";
            la = "eza --icons -a";
            ll = "eza --icons -l";
            less = "bat --theme Nord -p";
            cat = "bat --theme Nord -pp";
            c = "clear";
            cls = "clear && ls";
        };
        shellInit = ''
            function sudo
                if test "$argv[1]" = "rm"
                    command sudo trash-put $argv[2..-1]
                else
                    command sudo $argv
                end
            end
        '';
    };
}
