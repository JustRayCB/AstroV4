return { -- override blink.cmp plugin
  "Saghen/blink.cmp",
  dependencies = {
    "kdheepak/cmp-latex-symbols",
    "hrsh7th/cmp-calc",
    "moyiz/blink-emoji.nvim",
  },
  specs = {
    { "Saghen/blink.compat", version = "*", lazy = true, opts = {} },
  },
  opts = {
    keymap = {
      ["<Tab>"] = { "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
      ["<CR>"] = { "accept", "fallback" },

      ["<c-j>"] = { "select_next", "fallback" },
      ["<c-k>"] = { "select_prev", "fallback" },
    },
    completion = { list = { selection = { preselect = true, auto_insert = false } } },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "emoji", "latex", "calc" },
      providers = {
        path = { opts = { trailing_slash = false, show_hidden_files_by_default = true }, score_offset = 3 },
        lsp = { score_offset = 0 },
        snippets = { score_offset = -1 },
        buffer = { score_offset = -3 },
        emoji = { name = "Emoji", module = "blink-emoji", min_keyword_length = 1, score_offset = -1 },
        latex = {
          name = "latex_symbols",
          module = "blink.compat.source",
          score_offset = -1,
        },
        calc = {
          name = "calc",
          module = "blink.compat.source",
          score_offset = -1,
        },
      },
    },
  },
}
