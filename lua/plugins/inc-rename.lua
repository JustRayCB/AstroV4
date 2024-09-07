return {
  -- Fix "jj" escaping the renaming window
  {
    "stevearc/dressing.nvim",
    opts = { input = { insert_only = false } },
  },
  {
    "smjonas/inc-rename.nvim",
    -- event = "User AstroLspSetup",
    -- ft = { "java" },
    cmd = "IncRename",
    opts = {},
  },
  {
    "folke/noice.nvim",
    optional = true,
    opts = {
      presets = {
        inc_rename = true,
      },
    },
  },
}
