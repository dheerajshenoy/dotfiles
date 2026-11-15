local M = {}

local function color(group, attr)
    return vim.api.nvim_get_hl(0, { name = group, link = false })[attr]
end

local function setup_highlights()
    local dark = color('Normal', 'bg') or (vim.o.background == 'dark' and 0x181825 or 0xeeeeee)
    local modules = {
        SlFile = 'Function',
        SlType = 'Type',
        SlGit  = 'Keyword',
        SlPos  = 'String',
    }
    for name, source in pairs(modules) do
        vim.api.nvim_set_hl(0, name, { bg = color(source, 'fg'), fg = dark, bold = true })
    end
end

function M.render()
    local buf = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
    local branch = vim.b[buf].gitsigns_head
    local ft = vim.bo[buf].filetype

    return table.concat({
        '%#SlFile# %t%m%r ',
        '%#StatusLine#%=',
        '%#StatusLine# %l:%c ',
        (branch and branch ~= '') and ('%#SlGit# ' .. branch .. ' ') or '',
        '%#SlType# ', ft ~= '' and ft or 'none', ' ',
    })
end

setup_highlights()
vim.api.nvim_create_autocmd('ColorScheme', { callback = setup_highlights })

_G.Statusline = M
vim.o.statusline = '%!v:lua.Statusline.render()'
vim.o.laststatus = 3   -- one global bar; use 2 for one per window

return M
