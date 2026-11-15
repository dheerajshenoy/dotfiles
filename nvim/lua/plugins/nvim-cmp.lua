return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',   -- LSP completions
        'hrsh7th/cmp-buffer',     -- words from the buffer
        'hrsh7th/cmp-path',       -- file paths
    },
    config = function()
        local cmp = require('cmp')
        cmp.setup {
            mapping = cmp.mapping.preset.insert {
                ['<C-n>']     = cmp.mapping.select_next_item(),
                ['<C-p>']     = cmp.mapping.select_prev_item(),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>']     = cmp.mapping.abort(),
                ['<CR>']      = cmp.mapping.confirm { select = false },
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'path' },
                { name = 'buffer' },
            },
        }
    end,
}
