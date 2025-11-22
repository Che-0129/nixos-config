{ ... }:

{
    services.mako = {
        enable = true;
        settings = {
            sort = "-time";
            layer = "overlay";
            background-color = "#383c4a";
            width = 350;
            height = 110;
            border-size = 2;
            border-color = "#5294e2";
            border-radius = 4;
            icons = 1;
            max-icon-size = 64;
            default-timeout = 5000;
            ignore-timeout = 1;
            padding = 4;
            font = "Noto Sans CJK JP 10";
            margin = 20;
            anchor = "top-center";
            format = "<b><u>%a</u></b>\n<i>%b %s</i>";
            "urgency=low" = {
                border-color = "#81a1c1";
            };
            "urgency=normal" = {
                border-color = "#88c0d0";
            };
            "urgency=high" = {
                border-color = "#bf616a";
                default-timeout = 0;
            };
        };
    };
}
