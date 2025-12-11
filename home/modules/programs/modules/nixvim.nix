{ inputs, pkgs, ... }:

{
    imports = [ inputs.nixvim.homeModules.nixvim ];

    programs.nixvim = {
        enable = true;
        extraPlugins = [ pkgs.vimPlugins.onenord-nvim ];
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
        colorscheme = "onenord";
        plugins = {
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
            illuminate.enable = true;
            which-key.enable = true;
            blink-cmp = {
                enable = true;
                settings = {
                    completion = {
                        documentation = {
                            auto_show = true;
                            window.border = "rounded";
                        };
                        menu.border = "rounded";
                    };
                    keymap = {
                        preset = "enter";
                        "<C-y>" = [ "accept" "fallback" ];
                    };
                    sources.default = [
                        "lsp"
                        "path"
                        "snippets"
                        "buffer"
                    ];
                };
            };
            blink-pairs.enble = true;
            blink-indent.enable = true;
            luasnip.enable = true;
            friendly-snippets.enable = true;
            lsp = {
                enable = true;
                servers = {
                    clangd.enable = true;
                    cssls.enable = true;
                    html.enable = true;
                    lua_ls.enable = true;
                    pyright.enable = true;
                };
            };
            mason.enable = true;
            mason-lspconfig.enable = true;
        };
    };
}
