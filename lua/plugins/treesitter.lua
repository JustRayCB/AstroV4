-- Customize Treesitter
---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "json",
      "python",
      "java",
      "cpp",
      "c",
      "markdown",
      "javascript",
      "bibtex",
      "css",
      "html",
      "sql",
    },
  },
}
