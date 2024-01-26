-- if true then return {} end -- REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings set up as well as which-key menu titles
---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      n = {
        -- ======= Buffer Realted ========
        ["L"] = {
          function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Next buffer",
        },
        ["H"] = {
          function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          desc = "Previous buffer",
        },
        ["<Leader>c"] = {
          function()
            local bufs = vim.fn.getbufinfo { buflisted = true }
            require("astrocore.buffer").close(0)
            if require("astrocore").is_available "alpha-nvim" and bufs ~= nil and not bufs[2] then
              require("alpha").start(false)
            end
          end,
          desc = "Close buffer",
        },
        ["<Leader>C"] = {
          function()
            local bufs = vim.fn.getbufinfo { buflisted = true }
            require("astrocore.buffer").close(0, true)
            if require("astrocore").is_available "alpha-nvim" and bufs ~= nil and not bufs[2] then
              require("alpha").start(false)
            end
          end,
          desc = "Close buffer",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick Buffer to close",
        },
        ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        ["<Leader>b\\"] = false,
        ["<Leader>b-"] = {
          function()
            require("astroui.status.heirline").buffer_picker(function(bufnr)
              vim.cmd.split()
              vim.api.nvim_win_set_buf(0, bufnr)
            end)
          end,
          desc = "Horizontal Split buffer from Tabline",
        },
        ["<Leader>b|"] = false,
        ["<Leader>b="] = {
          function()
            require("astroui.status.heirline").buffer_picker(function(bufnr)
              vim.cmd.vsplit()
              vim.api.nvim_win_set_buf(0, bufnr)
            end)
          end,
          desc = "Horizontal Split buffer from Tabline",
        },
        -- ======= END Buffer Realted ========
        -- ======= Movements Related =======

        ["<Leader><Leader>s"] = { "<cmd>1<cr>", desc = "Go to the first line of the file" },
        ["<Leader><Leader>e"] = { "<cmd>%<cr>", desc = "Go to the last line of the file" },

        -- ======= END Movements Related =======
        -- ======= Telescope Related =======
        -- TODO: Move these mappings in the telescope config file
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
                    vim.api.nvim_exec(":edit " .. cwd .. "/" .. prompt, false)
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
                  -- local picker = vim.fn.bufnr()
                  local picker = prompt_bufnr
                  local selection = require("telescope.actions.state").get_selected_entry()
                  vim.fn.execute("silent !wslview '" .. selection.path .. "'")
                  require("telescope.actions").close(picker)
                end)
                return true
              end,
            }
          end,
          desc = "Open file with wslview",
        },
        -- ======= END Telescope Related =======

        ["<c-c>"] = { "y", desc = "Copy To clipboard" },
        ["a"] = { "<c-y>", desc = "Move Window one line up" },
        ["f"] = { "<c-e>", desc = "Move Window one line down" },
        ["<Leader>sa"] = { "<cmd>au! CursorHoldI,CursorHold,BufLeave <buffer> silent w<CR>", desc = "Autosave" },
        ["<F2>"] = { "<cmd>OverseerRun<cr>", desc = "Run a file" },
        ["gbt"] = { "<cmd>GitBlameToggle<cr>", desc = "Toggle GitBlame" },
        ["gbf"] = { "<cmd>GitBlameOpenFileURL<cr>", desc = "Open the file url in github" },
        ["gbco"] = { "<cmd>GitBlameOpenCommitURL<cr>", desc = "Open the commit url in github" },
        ["<C-a>"] = { "ggVG", desc = "Select all the text from a file" },

        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
      },
      t = {
        ["<esc>"] = false,
        ["J"] = { "<C-\\><C-n>", desc = "Switch to normal mode" },
      },
      v = {
        -- ["<Leader>c"] = false,
        ["y"] = { "ygv<esc>", desc = "Make the cursor not move after yank" },
        ["<c-c>"] = { "y", desc = "Copy to clipboard" },
        -- ["m"] = { "w", desc = "one word to the left" },
        ["<"] = { "<gv^", desc = "Keep visual mode after Indent left" },
        [">"] = { ">gv^", desc = "Keep visual mode after Indent right" },
        ["r"] = { ":'<,'>SnipRun<cr>", desc = "Run code with Sniprun", silent = true },
      },
      c = {
        ["<C-j>"] = { "<C-n>", desc = "Move down in command mode" },
        ["<C-k>"] = { "<C-p>", desc = "Move up in command mode" },
      },
    },
  },
}
