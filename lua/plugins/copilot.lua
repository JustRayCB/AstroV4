return {
  {
    "zbirenbaum/copilot.lua",
    -- cmd = "Copilot",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<C-e>"] = { "<cmd>Copilot enable<cr>" },
              ["<C-d>"] = { "<cmd>Copilot disable<cr>" },
            },
            i = {
              ["<C-e>"] = { "<esc>`^<cmd>Copilot enable<cr>i" },
              ["<C-d>"] = { "<esc>`^<cmd>Copilot disable<cr>i" },
            },
          },
        },
      },
    },
    event = "User AstroFile",
    opts = {
      suggestion = {
        auto_trigger = true,
        debounce = 150,
        keymap = {
          accept = "<C-l>",
          accept_word = "<C-m>",
          accept_line = "<C-down>",
          next = "<C-x>",
          prev = "<C-z>",
          -- dismiss = "<C-c>",
        },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    -- dependencies = { "zbirenbaum/copilot.lua" },
    opts = function(_, opts)
      local cmp, copilot = require "cmp", require "copilot.suggestion"
      local snip_status_ok, luasnip = pcall(require, "luasnip")
      if not snip_status_ok then return end
      local function has_words_before()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end
      if not opts.mapping then opts.mapping = {} end
      opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
        if copilot.is_visible() then
          copilot.accept()
        elseif cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" })

      opts.mapping["<C-x>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.next() end
      end)

      opts.mapping["<C-z>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.prev() end
      end)

      -- opts.mapping["<C-right>"] = cmp.mapping(function()
      --   if copilot.is_visible() then copilot.accept_word() end
      -- end)
      --
      -- opts.mapping["<C-l>"] = cmp.mapping(function()
      --   if copilot.is_visible() then copilot.accept_word() end
      -- end)
      --
      -- opts.mapping["<C-down>"] = cmp.mapping(function()
      --   if copilot.is_visible() then copilot.accept_line() end
      -- end)
      --
      -- opts.mapping["<C-j>"] = cmp.mapping(function()
      --   if copilot.is_visible() then copilot.accept_line() end
      -- end)
      --
      -- opts.mapping["<C-c>"] = cmp.mapping(function()
      --   if copilot.is_visible() then copilot.dismiss() end
      -- end)

      return opts
    end,
  },

  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            v = {
              ["<c-a>"] = { "<cmd>CodeCompanionActions<cr>", noremap = true, silent = true },
            },
          },
        },
      },
    },
    config = true,
    opts = {
      strategies = {
        chat = { adapter = "copilot" },
        inline = { adapter = "copilot" },
      },
    },
  },
}
