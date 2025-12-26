{ inputs, pkgs, ... }:

{
    imports = [ inputs.nixvim.homeModules.nixvim ];

    programs.nixvim = {
        enable = true;
        extraPlugins = with pkgs.vimPlugins; [
            onenord-nvim
            blink-pairs
            (pkgs.vimUtils.buildVimPlugin {
                pname = "modes-nvim";
                version = "0.3.0";
                src = inputs.modes-nvim;
            })
        ];
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
            mouse = "";
            hlsearch = false;
            termguicolors = true;
            guicursor = "i:ver100-blinkon500-blinkoff500";
        };
        extraConfigLua = ''
require("blink.pairs").setup({})
require("modes").setup({})
require("whitespace-nvim").setup({})

vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",
    command = "set guicursor=a:ver25-blinkon500-blinkoff500",
})
vim.api.nvim_create_augroup("RetabBeforeWrite", {
    clear = true
})
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "RetabBeforeWrite",
    pattern = "*",
    command = "retab"
})
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        local yank_type = vim.v.event.operator
        if yank_type == "y" then
            vim.fn.setreg("+", vim.fn.getreg("\""))
        end
end,
})
vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineLeave" }, {
    callback = function()
        vim.fn.jobstart({ "fcitx5-remote", "-c" }, { detach = true })
    end
})
        '';
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
            whitespace.enable = true;
            colorizer.enable = true;
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
                    nil_ls.enable = true;
                    pyright.enable = true;
                };
            };
        };
    };
}
