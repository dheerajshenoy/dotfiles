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
