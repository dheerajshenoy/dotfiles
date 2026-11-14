vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        version = "main",
        data = {
            event = { "BufReadPre", "BufNewFile" },
            after = function()
                local want = {
                    "lua", "vim", "vimdoc", "query", "bash", "c", "cpp",
                    "python", "markdown", "markdown_inline", "typst", "latex",
                }
                -- only invoke the installer when a parser is actually missing
                local have = require("nvim-treesitter.config").get_installed()
                local missing = vim.tbl_filter(function(l)
                    return not vim.tbl_contains(have, l)
                end, want)
                if #missing > 0 then
                    require("nvim-treesitter").install(missing)
                end
            end,
        },
    },
}, { load = require("lz.n").load })
