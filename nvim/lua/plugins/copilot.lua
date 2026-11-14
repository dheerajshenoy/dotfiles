vim.pack.add({
    {
        src = 'https://github.com/github/copilot.vim',
        data = { event = 'InsertEnter' },
    },
}, { load = require('lz.n').load })
