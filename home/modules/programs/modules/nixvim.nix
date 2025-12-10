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
        colorschemes.onenord.enable = true;
    };
}
