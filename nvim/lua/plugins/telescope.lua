return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'Telescope',
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<cr>',  desc = 'Find files' },
        { '<leader>fg', '<cmd>Telescope live_grep<cr>',   desc = 'Live grep' },
        { '<leader>fb', '<cmd>Telescope buffers<cr>',     desc = 'Buffers' },
        { '<leader>fh', '<cmd>Telescope help_tags<cr>',   desc = 'Help' },
        { '<leader>fr', '<cmd>Telescope oldfiles<cr>',    desc = 'Recent files' },
        { '<leader>fs', '<cmd>Telescope lsp_document_symbols<cr>', desc = 'Symbols' },
        { 'gr',         '<cmd>Telescope lsp_references<cr>', desc = 'References' },
        { '<leader>fo', '<cmd>Telescope lsp_document_symbols<cr>', desc = 'Document symbols' },
    },
    opts = {},
}
