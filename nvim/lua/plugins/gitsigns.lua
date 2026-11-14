vim.pack.add({
    {
        src = 'https://github.com/lewis6991/gitsigns.nvim',
        data = {
            event = { 'BufReadPre', 'BufNewFile' },
            after = function()
                require('gitsigns').setup()
            end,
        },
    },
}, { load = require('lz.n').load })
