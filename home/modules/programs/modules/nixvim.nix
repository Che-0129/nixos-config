{ inputs, ... }:

{
    imports = [ inputs.nixvim.homeModules.nixvim ];

    programs.nixvim = {
        enable = true;
        opts = {
            number = true;
            title = true;
            tabstop = 4;
            shiftwidth = 4;
            expandtab = true;
            swapfile = false;
            autoread = true;
            incsearch = true;
            smartindent = true;
            scrolloff = 5;
            sidescrolloff = 5;
            mouse = null;
            hlsearch = false;
            termguicolors = true;
            guicursor = "i:ver100-blinkon500-blinkoff500";
        };
        plugins = {
            onenord.enable = true;
            lualine.enable = true;
            smear-cursor = {
                enable = true;
                settings = {
                    trailing_stiffness = 0.5;
                    stiffness_insert_mode = 0.7;
                    trailing_stiffness_insert_mode = 0.7;
                    damping = 0.8;
                    damping_insert_mode = 0.8;
                    distance_stop_animating = 0.5;
                };
            };
            neoscroll.enable = true;
            whitespace-nvim.enable = true;
            nvim-colorizer.enable = true;
            which-key.enable = true;
        };
    };
}
