{ nixvim, pkgs, ... }: {
    imports = [ nixvim.homeModules.nixvim ];
    programs.nixvim = {
        enable = true;
        extraPlugins = [ pkgs.vimPlugins.onenord-nvim ];
        defaultEditor = true;
        opts = {
            autoindent = true;
            autoread = true;
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
        autoCmd = [
            {
                event = "VimLeave";
                pattern = "*";
                command = "set guicursor=a:ver25-blinkon500-blinkoff500";
            }
            {
                event = "BufWritePre";
                pattern = "*";
                group = "RetabBeforeWrite";
                command = "retab";
            }
            {
                event = "TextYankPost";
                callback.__raw = ''
                    function()
                        local yank_type = vim.v.event.operator
                        if yank_type == "y" then
                            vim.fn.setreg("+", vim.fn.getreg("\""))
                        end
                    end
                '';
            }
            {
                event = [ "InsertLeave" "CmdlineLeave" ];
                callback.__raw = ''
                    function()
                        vim.fn.jobstart({ "fcitx5-remote", "-c" }, { detach = true })
                    end
                '';
            }
        ];
        autoGroups.RetabBeforeWrite.clear = true;
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
                    keymap = {
                        preset = "enter";
                        "<C-y>" = [ "accept" "fallback" ];
                    };
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
            illuminate.enable = true;
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
                indent.enable = true;
            };
            whitespace.enable = true;
        };
    };
}
