{ ... }:

{
    programs.fuzzel = {
        enable = true;
        settings = {
            main = {
                font = "NotoSansCJKjp:size=10";
                use-bold = true;
                placeholder = "Search...";
                terminal = "foot -e";
                launch-prefix = "uwsm app --";
                lines = 8;
                horizontal-pad = 48;
                vertical-pad = 32;
                inner-pad = 8;
                line-height = 24;
                layer = "overlay";
            };
            colors = {
                background = "292e42d9";
                text = "b6b6b6ff";
                input = "ffffffff";
                match = "779abaff";
                selection = "00000040";
                selection-text = "ffffffff";
                selection-match = "1793d1ff";
                border = "5294e2ff";
            };
            border = {
                radius = 8;
                width = 2;
                selection-radius = 8;
            };
        };
    };
}
