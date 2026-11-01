vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

require("nvim-treesitter").install({
  "lua",
  "vim",
  "vimdoc",
  "query",
  "bash",
  "c",
  "cpp",
  "python",
  "markdown",
  "markdown_inline",
  "typst",
  "latex",
})
