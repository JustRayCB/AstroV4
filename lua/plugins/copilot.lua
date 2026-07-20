return {
  {
    "zbirenbaum/copilot.lua",
    -- cmd = "Copilot",
    enabled = false,
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          options = {
            g = {
              -- set the ai_accept function
              ai_accept = function()
                if require("copilot.suggestion").is_visible() then
                  require("copilot.suggestion").accept()
                  return true
                end
              end,
            },
          },
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
          accept = "<S-Tab>",
          accept_word = false,
          next = "<C-x>",
          prev = "<C-z>",
          dismiss = "<C-c>",
        },
      },
    },
  },

  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "nvim-treesitter/nvim-treesitter",
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
      interactions = {
        chat = {
          adapter = {
            name = "copilot",
            model = "",
          },
        },
      },
    },
  },
}
