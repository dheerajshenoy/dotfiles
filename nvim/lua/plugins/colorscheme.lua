return {
    "catppuccin/nvim",
    name = 'catppuccin',
    lazy = false,
    priority = 1000,   -- load before other plugins
    opts = {
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
        transparent_background = false,
        integrations = {
            treesitter = true,
            gitsigns = true,
            telescope = { enabled = true },
            blink_cmp = true, -- use cmp = true if you use nvim-cmp
            flash = true,
        },
    },
    config = function(_, opts)
        require('catppuccin').setup(opts)
        vim.cmd.colorscheme('catppuccin')
    end,
}
