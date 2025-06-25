return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  dependencies = { -- add a new dependency to telescope that is our new plugin
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["gr"] = {
              "<cmd>lua Snacks.picker.lsp_references()<cr>",
              desc = "Override default go to reference",
              silent = true,
            },
            ["<Leader>="] = {
              function()
                vim.cmd "vsplit"
                Snacks.picker.files()
              end,
              desc = "Open a split tab and choose file with Snacks",
            },
            ["<Leader>-"] = {
              function()
                vim.cmd "split"
                Snacks.picker.files()
              end,
              desc = "Open a split tab and choose file with Snacks",
            },
            ["<Leader>fg"] = {
              "<cmd>lua Snacks.picker.git_files()<cr>",
              desc = "Open git file with telescope ",
            },
            ["<Leader>fg="] = {
              function()
                vim.cmd "vsplit"
                Snacks.picker.git_files()
              end,
              desc = "Open split pane with telescope git",
            },
          },
        },
      },
    },
  },
  opts = {
    picker = {
      lsp = {
        references = {
          finder = "lsp_references",
          format = "file",
          include_declaration = true,
          include_current = true,
          auto_confirm = true,
          jump = { tagstack = true, reuse_win = true },
        },
      },
      -- your picker configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
