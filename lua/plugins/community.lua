---@type LazySpec
return {
  -- "AstroNvim/astrocommunity",
  -- Add community imports to the `lua/config/lazy.lua` file in your Neovim configuration folder (typically ~/.config/nvim)
  -- this guarantees that the community plugin specs are loaded before the user configuration

  -- This is a good place to do further customize the options set by the community plugins/packs
  -- NOTE: uncommenting below assumes you have the catppuccin AstroCommunity plugin imported in `lua/config/lazy.lua`
  -- {
  --   "catppuccin/nvim",
  --   opts = {
  --     integrations = {
  --       sandwich = false,
  --       noice = true,
  --       mini = true,
  --       leap = true,
  --       markdown = true,
  --       neotest = true,
  --       cmp = true,
  --       overseer = true,
  --       lsp_trouble = true,
  --       rainbow_delimiters = true,
  --     },
  --   },
  -- },
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      vim.api.nvim_set_keymap("n", "<leader>lr", ":IncRename ", { noremap = false })
      local utils = require "astrocore"
      local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", ".project" }
      local root_dir = function()
        if not require("jdtls.setup").find_root(root_markers) then -- If there I just want to code outside a project
          return vim.fn.getcwd()
        else
          return require("jdtls.setup").find_root(root_markers)
        end
      end
      return utils.extend_tbl({ root_dir = root_dir() }, opts)
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      -- "nvim-neotest/neotest-python",
      "rcasia/neotest-java",
      "antoinemadec/FixCursorHold.nvim",
      "vim-test/vim-test",
      {
        "rcasia/neotest-java",
        commit = "3a1853d55789b03ef71e1748a69470a0d016afad", --becomes weird after that plugin
      },
    },
    config = function()
      ---@diagnostic disable: missing-fields
      require("neotest").setup {
        adapters = {
          require "neotest-python" {
            dap = { justMyCode = false },
            runner = "pytest",
          },
          require "neotest-java" { ignore_wrapper = false },
        },
      }
    end,
  },
}
