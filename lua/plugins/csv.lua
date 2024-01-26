return {
  "cameron-wags/rainbow_csv.nvim",
  lazy = true,
  event = { "BufEnter *.csv" },
  config = true,
  init = function()
    -- vim.g.disable_rainbow_key_mappings = 1
    vim.g.disable_rainbow_hover = 1
  end,
  ft = {
    "csv",
    "tsv",
    "csv_semicolon",
    "csv_whitespace",
    "csv_pipe",
    "rfc_csv",
    "rfc_semicolon",
  },
  cmd = {
    "RainbowDelim",
    "RainbowDelimSimple",
    "RainbowDelimQuoted",
    "RainbowMultiDelim",
  },
  -- let g:disable_rainbow_csv_autodetect = 1
}
