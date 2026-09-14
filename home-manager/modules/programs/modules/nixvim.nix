{ config, inputs, pkgs, ... }: {
    imports = [ inputs.nixvim.homeModules.nixvim ];
    programs.nixvim = {
        enable = true;
        colorschemes.onenord.enable = true;
        defaultEditor = true;
        nixpkgs.config.allowUnfree = true;
        nixpkgs.source = pkgs.path;
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
        autoCmd = [
            {
            event = [ "InsertLeave" "CmdlineLeave" ];
            callback.__raw = ''
                function()
                    vim.system({ "fcitx5-remote", "-c" }, { detach = true })
                end
            '';
            }
            {
                event = [ "FileType" ];
                pattern = [ "nix" ];
                command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab";
            }
        ];
        diagnostic.settings = {
            virtual_text = true;
            underline = true;
        };
        keymaps = [
            {
                action = "gj";
                key = "j";
                mode = "n";
            }
            {
                action = "gk";
                key = "k";
                mode = "n";
            }
        ];
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
            blink-pairs = {
                enable = true;
                settings.mappings.pairs.__raw = ''
                    (function()
                        local function only_before_whitespace(ctx)
                            local char_after = ctx.line:sub(ctx.cursor.col + 1, ctx.cursor.col + 1)
                            return char_after == "" or char_after:match("%s")
                        end

                        return {
                            ["{"] = { { "}", open = only_before_whitespace } },
                            ["("] = { { ")", open = only_before_whitespace } },
                            ["["] = { { "]", open = only_before_whitespace } },
                            ['"'] = { { '"', open_or_close = only_before_whitespace } },
                            ["'"] = { { "'", open_or_close = only_before_whitespace } }
                        }
                    end)()
                '';
            };
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
                    rust_analyzer = {
                        enable = true;
                        installCargo = true;
                        installRustc = true;
                    };
                };
            };
            lualine.enable = true;
            modicator.enable = true;
            neoscroll.enable = true;
            treesitter = {
                enable = true;
                grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
                    c
                    cpp
                    css
                    html
                    json
                    lua
                    nix
                    python
                    rust
                ];
                highlight.enable = true;
                indent.enable = true;
            };
            whitespace.enable = true;
        };
    };
}
