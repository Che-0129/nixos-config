{ ... }:

{
    programs.hyprlock = {
        enable = true;
        settings = {
            general = {
                hide_cursor = true;
                ignore_empty_input = true;
                fail_timeout = 500;
            };
            background = {
                path = "screenshot";
                blur_passes = 1;
                blur_size = 4;
            };
            input-field = {
                size = "250, 50";
                outline_thickness = 3;
                dots_spacing = 1.0;
                outer_color = "rgba(5294e2bf)";
                inner_color = "rgba(404552bf)";
                font_color = "rgb(ffffff)";
                position = "0, -70";
            };
            label = [
                {
                    text = ''cmd[update:1000] echo "<b><big> $(date +"%H") </big></b>"'';
                    shadow_passes = 4;
                    shadow_color = "rgb(5294e2)";
                    font_size = 128;
                    font_family = "Moralerspace Neon HW";
                    position = "0, 240";
                }
                {
                    text = ''cmd[update:1000] echo "<b><big> $(date +"%M") </big></b>"'';
                    shadow_passes = 4;
                    shadow_color = "rgb(5294e2)";
                    font_size = 128;
                    font_family = "Moralerspace Neon HW";
                    position = "0, 80";
                }
                {
                    text = ''cmd[update:60000] echo "<b><big> $(date +"%m/%d") </big></b>"'';
                    shadow_passes = 4;
                    shadow_color = "rgb(5294e2)";
                    shadow_boost = 4;
                    font_family = "Moralerspace Neon HW";
                    position = "0, -160";
                }
                {
                    text = ''cmd[update:60000] echo "<b><big> $(LC_TIME=C date +"%A") </big></b>"'';
                    shadow_passes = 4;
                    shadow_color = "rgb(5294e2)";
                    shadow_boost = 4;
                    font_family = "Moralerspace Neon HW";
                    position = "0, -180";
                }
            ];
        };
    };
}
