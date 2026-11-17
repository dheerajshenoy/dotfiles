return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        -- install parsers (async, skips ones already installed)
        require('nvim-treesitter').install {
            'c',
            'cpp',
            'lua',
            'vim',
            'vimdoc',
            'markdown',
            'python',
            'bash',
            'html',
            'javascript',
            'json',
            'typst',
            'latex',
            'glsl',
        }

        -- the new version doesn't enable highlighting by itself
        vim.api.nvim_create_autocmd('FileType', {
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(args.match)
                if lang and pcall(vim.treesitter.language.add, lang) then
                    if pcall(vim.treesitter.start, args.buf, lang) then
                        vim.wo[0][0].foldmethod = 'expr'
                        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                    end
                end
            end,
        })
    end,
}
