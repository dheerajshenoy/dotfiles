vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
})

vim.pack.add({
    {
        src = 'https://github.com/neovim/nvim-lspconfig',
        data = {
            event = { 'BufReadPre', 'BufNewFile' },
            after = function()
                vim.lsp.config['lua_ls'] = {
                    settings = {
                        Lua = {
                            runtime = { version = 'LuaJIT' },
                            workspace = { library = vim.api.nvim_get_runtime_file('', true) },
                            telemetry = { enable = false },
                        },
                    },
                }

                vim.lsp.config['tinymist'] = {
                    cmd = { 'tinymist' },
                    filetypes = { 'typst' },
                    settings = { exportPdf = 'onSave' },
                }

                vim.lsp.enable({ 'lua_ls', 'clangd', 'pyright', 'taplo', 'tinymist' })
            end,
        },
    },
}, { load = require('lz.n').load })
