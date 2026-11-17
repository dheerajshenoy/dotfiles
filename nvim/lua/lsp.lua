-- settings applied to every server
vim.lsp.config("*", {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
})

-- per-server overrides, merged with lspconfig's defaults
vim.lsp.config("clangd", {
    cmd = { "clangd", "--background-index", "--clang-tidy",
    "--header-insertion=never", "-j=4", "--pch-storage=memory" },
})

vim.lsp.config("lua_ls", {
    settings = { Lua = { diagnostics = { globals = { "vim" } } } },
})

vim.lsp.config("pyright", {
    settings = { python = { analysis = { typeCheckingMode = "off" } } },
})


vim.lsp.enable({ "clangd", "lua_ls", "pyright" })
