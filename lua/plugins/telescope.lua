return {
  "nvim-telescope/telescope.nvim",
  dependencies = { -- add a new dependency to telescope that is our new plugin
    "ThePrimeagen/refactoring.nvim",
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["gr"] = { "<cmd>Telescope lsp_references<cr>", desc = "Override default go to reference", silent = true },
            ["<Leader>ff"] = {
              function()
                require("telescope.builtin").find_files {
                  prompt_title = "Files",
                  -- file_ignore_patterns = { "node_modules" },
                  attach_mappings = function(_, map)
                    map("i", "<CR>", function(prompt_bufnr)
                      -- local picker = vim.fn.bufnr()
                      local picker = prompt_bufnr
                      -- if picker == nil then return false end
                      local selection = require("telescope.actions.state").get_selected_entry()
                      if selection ~= nil and vim.fn.filereadable(selection.path) == 1 then
                        require("telescope.actions").file_edit(picker)
                      else
                        local current_picker = require("telescope.actions.state").get_current_picker(picker)
                        local prompt = current_picker:_get_prompt()
                        require("telescope.actions").close(picker)
                        local cwd = vim.fn.getcwd()
                        local path = cwd .. "/" .. prompt
                        local parent_dir = vim.fn.fnamemodify(path, ":h")
                        if vim.fn.isdirectory(parent_dir) == 0 then vim.fn.mkdir(parent_dir, "p") end
                        vim.cmd(":edit " .. cwd .. "/" .. prompt, false)
                      end
                      -- require("telescope.actions").close(picker)
                    end)
                    return true
                  end,
                }
              end,
              desc = "Find files, open it if it exits, and create it if it doesn't (directory included)",
            },
            ["<Leader>="] = {
              "<cmd>vsp | Telescope find_files<cr>",
              desc = "Open a split tab and choose file with telescope",
            },
            ["<Leader>-"] = {
              "<cmd>sp | Telescope find_files<cr>",
              desc = "Open a split tab and choose file with telescope",
            },
            ["<Leader>fg"] = { "<cmd>Telescope git_files<cr>", desc = "Open git file with telescope " },
            ["<Leader>fg="] = { "<cmd>vsp | Telescope git_files<cr>", desc = "Open split pane with telescope git" },
            ["<Leader>o"] = {
              function()
                -- vim.cmd("cd " .. vim.fn.getcwd())
                require("telescope.builtin").find_files {
                  prompt_title = "Fichiers",
                  attach_mappings = function(_, map)
                    map("i", "<CR>", function(prompt_bufnr)
                      local picker = prompt_bufnr
                      local selection = require("telescope.actions.state").get_selected_entry()
                      vim.fn.execute("silent !xdg-open'" .. selection.path .. "'")
                      require("telescope.actions").close(picker)
                    end)
                    return true
                  end,
                }
              end,
              desc = "Open file with default viewer from the root of the project",
            },
          },
        },
      },
    },
  },
  -- the first parameter is the plugin specification
  -- the second is the table of options as set up in Lazy with the `opts` key
  config = function(plugin, opts)
    -- run the core AstroNvim configuration function with the options table
    require "astronvim.plugins.configs.telescope"(plugin, opts)
    -- load refactoring Telescope extension
    require("telescope").load_extension "refactoring"
  end,
}
