return {
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
