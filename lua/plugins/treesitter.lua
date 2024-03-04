-- if true then return {} end -- REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Example customization of Treesitter
---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.auto_install = false
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
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
      -- add more arguments for adding more treesitter parsers
    })
  end,
}
