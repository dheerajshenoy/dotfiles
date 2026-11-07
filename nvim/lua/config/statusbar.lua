local NONE = "NONE"

local function color(group, attr)
    local h = vim.api.nvim_get_hl(0, { name = group, link = false })
    return h[attr]
end

-- first defined color from a list of {group, attr} pairs
local function pick(...)
    for _, p in ipairs({ ... }) do
        local c = color(p[1], p[2])
        if c then return c end
    end
end

local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

local function set_highlights()
    local text   = pick({ "Normal", "fg" })
    local dark   = pick({ "Normal", "bg" }) or 0x000000
    local accent = pick({ "Function", "fg" }, { "Special", "fg" }, { "Statement", "fg" })
    local raised = pick({ "CursorLine", "bg" }, { "Pmenu", "bg" }, { "ColorColumn", "bg" })
    local higher = pick({ "Visual", "bg" }, { "PmenuSel", "bg" }, { "Pmenu", "bg" })

    hi("StatusLine",      { bg = NONE, fg = NONE })
    hi("StatusLineNC",    { bg = NONE, fg = pick({ "Comment", "fg" }) })
    hi("StatusMode",      { bg = accent, fg = dark, bold = true })
    hi("StatusFile",      { bg = raised, fg = text })
    hi("StatusGitBranch", { bg = higher, fg = text })
    hi("StatusFileType",  { bg = raised, fg = text })
end


set_highlights()
vim.api.nvim_create_autocmd("ColorScheme", { callback = set_highlights })

-- built once, not on every redraw
local mode_names = {
    n = "NORMAL", no = "PENDING", v = "VISUAL", V = "V-LINE",
    ["\22"] = "V-BLOCK", s = "SELECT", S = "S-LINE", ["\19"] = "S-BLOCK",
    i = "INSERT", R = "REPLACE", Rv = "V-REPLACE", c = "COMMAND",
    cv = "EX", ce = "EX", r = "PROMPT", rm = "MORE", ["r?"] = "CONFIRM",
    ["!"] = "SHELL", t = "TERMINAL", nt = "NORMAL",
}

local get_mode = vim.api.nvim_get_mode
local getcmdtype = vim.fn.getcmdtype

-- escape % for the statusline (used for handling empty spaces)
local function esc(s) return (s:gsub("%%", "%%%%")) end

function StatusMode()
    local m = get_mode().mode
    if m == "c" then
        local t = getcmdtype()
        if t == "/" or t == "?" then return "SEARCH" end
    end
    return mode_names[m] or mode_names[m:sub(1, 2)] or "UNKNOWN"
end

function StatusGitBranch()
    local branch = vim.b.gitsigns_head
    if not branch or branch == "" then
        return ""
    end

    local gs = vim.b.gitsigns_status_dict

    branch = esc(branch)
    return "%#StatusGitBranch# " .. branch .. " "
end

function StatusFile()
    local name = vim.fs.basename(vim.api.nvim_buf_get_name(0))
    if name == "" then return "" end
    local mod = vim.bo.modified and " [+]" or ""
    return "%#StatusFile# " .. esc(name) .. mod .. " "
end

function StatusFileType()
    local ft = vim.bo.filetype
    if ft == "" then return "" end
    return "%#StatusFileType# " .. esc(ft:upper()) .. " "
end

vim.o.statusline = table.concat({
    "%#StatusMode# %{v:lua.StatusMode()} ",
    "%{%v:lua.StatusFile()%}",
    "%#StatusLine#",
    "%=",
    "%{%v:lua.StatusGitBranch()%}",
    "%#StatusLineNC# %p%% ",
    "%{%v:lua.StatusFileType()%}",
})

vim.opt.laststatus = 3
vim.opt.showmode = false
