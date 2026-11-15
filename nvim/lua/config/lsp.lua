-- vim.lsp.config('*', {
--     capabilities = require('cmp_nvim_lsp').default_capabilities(),
-- })

vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc', '.stylua.toml', '.git' },
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = { library = { vim.env.VIMRUNTIME }, checkThirdParty = false },
        },
    },
})

vim.lsp.config('clangd', {
    cmd = { 'clangd', '--background-index', '--clang-tidy', '--header-insertion=never', '-j=4', '--pch-storage=memory' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
    root_markers = { 'compile_commands.json', '.clangd', '.git' },
})

vim.lsp.config('pyright', {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'setup.py', 'requirements.txt', '.git' },
    settings = { python = { analysis = { autoSearchPaths = true, useLibraryCodeForDiagnostics = true } } },
})

vim.lsp.enable({ 'lua_ls', 'clangd', 'pyright' })
