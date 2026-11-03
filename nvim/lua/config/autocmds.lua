-- Turn on treesitter highlighting for any filetype that has a parser
vim.api.nvim_create_autocmd("FileType", {
    callback = function(ev) pcall(vim.treesitter.start, ev.buf) end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.hl.hl_op({ timeout = 250 })
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspAttach', { clear = true }),
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        if client and client.name == 'clangd' then
            vim.keymap.set('n', '<leader>fp', ":LspClangdSwitchSourceHeader<CR>", { buffer = ev.buf, desc = 'clangd: Switch source/header' })
        end

        local map = function(keys, fn, desc)
            vim.keymap.set('n', keys, fn, { buffer = ev.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', vim.lsp.buf.definition, 'Go to definition')
        map('gr', vim.lsp.buf.references, 'References')
        map('K',  vim.lsp.buf.hover, 'Hover docs')
        map('<leader>rn', vim.lsp.buf.rename, 'Rename')
        map('<leader>ca', vim.lsp.buf.code_action, 'Code action')
    end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('UserFormatOnSave', { clear = true }),
    pattern = { '*.c', '*.cpp', '*.h', '*.hpp' },
    callback = function(ev)
        vim.lsp.buf.format({ bufnr = ev.buf, async = false, timeout_ms = 2000 })
    end,
})
