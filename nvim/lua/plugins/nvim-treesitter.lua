return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        -- install parsers (async, skips ones already installed)
        require('nvim-treesitter').install {
            'c',
            'cpp',
            'lua',
            'vim',
            'vimdoc',
            'markdown',
            'python',
            'bash',
            'html',
            'javascript',
            'json',
            'typst',
            'latex',
        }

        -- the new version doesn't enable highlighting by itself
        vim.api.nvim_create_autocmd('FileType', {
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
            end,
        })
    end,
}
