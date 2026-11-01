local o = vim.opt

vim.g.mapleader = " "

o.cursorline = true
o.number = true
o.relativenumber = true
o.scrolloff = 8
o.signcolumn = "yes"
o.termguicolors = true
o.wrap = true

-- Indentation
o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4

-- Search
o.hlsearch = false
o.ignorecase = true
o.incsearch = true
o.smartcase = true          -- case-sensitive only if you type a capital

-- Behavior
-- o.clipboard = "unnamedplus" -- share the system clipboard
o.mouse = "a"
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.timeoutlen = 400
o.undofile = true          -- persistent undo across sessions
o.updatetime = 250
