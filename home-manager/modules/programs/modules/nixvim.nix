{ nixvim, pkgs, ... }: {
    imports = [ nixvim.homeModules.nixvim ];
    programs.nixvim = {
        enable = true;
        extraPlugins = [ pkgs.vimPlugins.onenord-nvim ];
        defaultEditor = true;
        opts = {
            autoindent = true;
            autoread = true;
            clipboard = "unnamedplus";
            expandtab = true;
            guicursor = "i:ver100-blinkon500-blinkoff500";
            hlsearch = false;
            incsearch = true;
            mouse = "";
            number = true;
            scrolloff = 5;
            shiftwidth = 4;
            sidescrolloff = 5;
            swapfile = false;
            tabstop = 4;
            termguicolors = true;
            title = true;
        };
        extraConfigLua = ''
            require("onenord").setup({
                disable = {
                    background = true
                }
            })
        '';
        autoCmd = [{
            event = [ "InsertLeave" "CmdlineLeave" ];
            callback.__raw = ''
                function()
                    vim.system({ "fcitx5-remote", "-c" }, { detach = true })
                end
            '';
        }];
        plugins = {
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
                    keymap.preset = "enter";
                    sources.default = [
                        "lsp"
                        "path"
                        "buffer"
                    ];
                };
            };
            blink-indent.enable = true;
            blink-pairs.enable = true;
            colorizer.enable = true;
            lsp = {
                enable = true;
                servers = {
                    clangd.enable = true;
                    cssls.enable = true;
                    html.enable = true;
                    jsonls.enable = true;
                    nixd.enable = true;
                    pyright.enable = true;
                };
            };
            lualine.enable = true;
            modicator.enable = true;
            neoscroll.enable = true;
            treesitter = {
                enable = true;
                grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
                    c
                    css
                    html
                    json
                    nix
                    python
                ];
                highlight.enable = true;
                indent.enable = true;
            };
            whitespace.enable = true;
        };
    };
}
