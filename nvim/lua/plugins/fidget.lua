vim.pack.add({
    {
        src = 'https://github.com/j-hui/fidget.nvim',
        data = {
            event = 'LspAttach',
            after = function()
                require('fidget').setup({})
            end,
        },
    },
}, { load = require('lz.n').load })
