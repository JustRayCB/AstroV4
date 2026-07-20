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
                require("snacks").picker.files()
              end,
              desc = "Open a split tab and choose file with Snacks",
            },
            ["<Leader>-"] = {
              function()
                vim.cmd "split"
                require("snacks").picker.files()
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
                require("snacks").picker.git_files()
              end,
              desc = "Open split pane with telescope git",
            },
            ["<Leader>fn"] = {
              function() require("snacks").picker.notifications { confirm = "focus_preview" } end,
              desc = "Notifications",
            },
            ["<Leader>fz"] = {
              function() require("snacks").picker.zoxide() end,
              desc = "Zoxide",
            },
            ["<Leader>fe"] = {
              function() require("snacks").picker.explorer() end,
              desc = "File Explorer",
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
      layouts = {
        custom_ivy_split = (function()
          local custom_ivy_split = vim.deepcopy(require("snacks.picker.config.layouts").ivy_split)
          custom_ivy_split.layout[1].border = "rounded" -- input field with rounded border
          custom_ivy_split.layout.height = 0.5 -- list area +0.1
          return custom_ivy_split
        end)(),
        right_preview = {
          layout = {
            -- Main container is a horizontal box
            box = "horizontal",
            width = 0.95,
            height = 0.95,
            -- The left side is a vertical box containing the input and list
            {
              box = "vertical",
              border = "rounded",
              title = "{source} {live}",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
            },
            -- The right side is the preview window
            { win = "preview", border = "rounded", width = 0.7 },
          },
        },
      },
      layout = { preset = "right_preview" },
      win = {
        wo = {
          wrap = true,
        },
        input = {
          keys = {
            ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<c-f>"] = { "list_scroll_up", mode = { "i", "n" } },
            ["<c-b>"] = { "list_scroll_down", mode = { "i", "n" } },
          },
        },
        list = {
          keys = {
            ["<c-u>"] = "preview_scroll_up",
            ["<c-d>"] = "preview_scroll_down",
            ["<c-f>"] = "list_scroll_up",
            ["<c-b>"] = "list_scroll_down",
          },
        },
      },
      -- your picker configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    image = { doc = { enabled = true } },
    indent = { indent = { char = "│" }, scope = { char = "│" } },
    bigfile = { enabled = false },
    win = {
      border = "rounded",
      backdrop = false,
    },
    -- styles = {
    --   notification = {
    --     wo = { wrap = true }, -- Wrap notifications
    --   },
    -- },
  },
}
