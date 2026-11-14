-- dependency: just installed, no trigger needed
vim.pack.add({ 'https://github.com/saghen/blink.lib' })

vim.pack.add({
    {
        src = 'https://github.com/saghen/blink.cmp',
        data = {
            event = { 'InsertEnter', 'CmdlineEnter' },
            after = function()
                local cmp = require('blink.cmp')
                cmp.build():pwait(60000)
                cmp.setup()
            end,
        },
    },
}, { load = require('lz.n').load })
