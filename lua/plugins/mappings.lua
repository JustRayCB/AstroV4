-- if true then return {} end -- REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings set up as well as which-key menu titles
---@type LazySpec
return {
  -- Mappings can be configured through AstroCore as well.
  -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      n = {
        -- ======= Buffer Realted ========
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
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

        ["<c-c>"] = { "y", desc = "Copy To clipboard" },
        ["a"] = { "<c-y>", desc = "Move Window one line up" },
        ["f"] = { "<c-e>", desc = "Move Window one line down" },
        ["<Leader>sa"] = { "<cmd>au! CursorHoldI,CursorHold,BufLeave <buffer> silent w<CR>", desc = "Autosave" },
        ["<F2>"] = { "<cmd>OverseerRun<cr>", desc = "Run a file" },
        ["gbt"] = { "<cmd>GitBlameToggle<cr>", desc = "Toggle GitBlame" },
        ["gbf"] = { "<cmd>GitBlameOpenFileURL<cr>", desc = "Open the file url in github" },
        ["gbco"] = { "<cmd>GitBlameOpenCommitURL<cr>", desc = "Open the commit url in github" },
        ["<C-Q>"] = false,
        ["<C-q>"] = { "<C-V>", desc = "Visual block mode" },
        ["gv"] = { desc = "Reselect last visual selection" },
        ["<A-j>"] = { "<cmd>m .+1<cr>==", desc = "Move line up", silent = true },
        ["<A-k>"] = { "<cmd>m .-2<cr>==", desc = "Move line up", silent = true },
      },
      i = {
        ["<esc>"] = { "<esc>`^", desc = "Not going to the right when escaping" },
        ["<A-j>"] = { "<esc>:m .+1<cr>==gi", desc = "Move line up" },
        ["<A-k>"] = { "<esc>:m .-2<cr>==gi", desc = "Move line up" },
      },
      t = {
        ["<esc>"] = false,
        ["J"] = { "<C-\\><C-n>", desc = "Switch to normal mode" },
      },
      v = {
        ["y"] = { "ygv<esc>", desc = "Make the cursor not move after yank" },
        ["<c-c>"] = { "y", desc = "Copy to clipboard" },
        ["<"] = { "<gv^", desc = "Keep visual mode after Indent left" },
        [">"] = { ">gv^", desc = "Keep visual mode after Indent right" },
        ["<Leader>ru"] = { ":'<,'>SnipRun<cr>", desc = "Run code with Sniprun", silent = true },
        ["<A-j>"] = { ":m '>+1<cr>gv=gv", desc = "Move the selected lines down", silent = true },
        ["<A-k>"] = { ":m '<-2<cr>gv=gv", desc = "Move the selected lines up", silent = true },
      },
      c = {
        ["<c-j>"] = { "<c-n>", desc = "Move down in command mode" },
        ["<c-k>"] = { "<c-p>", desc = "Move up in command mode" },
      },
    },
  },
}
