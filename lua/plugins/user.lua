-- You can also add new plugins here as well using the lazy syntax:
---@type LazySpec
return {
  -- "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "VimEnter", -- Bug with dap python (dap.lua, overseer.lua, community.python)
  },
  {
    "Wansmer/treesj",
    keys = { "<space>m" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup {--[[ your config ]]
        use_default_keymaps = false,
        -- vim.cmd "nnoremap <silent> <space>m <cmd>lua require('treesj').toggle()<cr>",
        -- vim.cmd "nnoremap <silent> <space>j <cmd>lua require('treesj').split()<cr>",
        -- vim.cmd "nnoremap <silent> <space>k <cmd>lua require('treesj').join()<cr>",
        vim.keymap.set("n", "<space>m", require("treesj").toggle, { noremap = true, silent = true }),
        vim.keymap.set("n", "<space>j", require("treesj").split, { noremap = true, silent = true }),
        vim.keymap.set("n", "<space>k", require("treesj").join, { noremap = true, silent = true }),
      }
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        highlight = {
          comments_only = false,
        },
      }
    end,
    -- opts = {},
    event = { "User AstroFile" },
    cmd = { "TodoQuickFix" },
    -- keys = {
    --   { "<leader>T", "<cmd>TodoTelescope<cr>", desc = "Open TODOs with Telescope" },
    -- },
  },
  {
    "echasnovski/mini.surround",
    keys = {
      { "sa", desc = "Add surrounding", mode = { "n", "v" } },
      { "sd", desc = "Delete surrounding" },
      { "sf", desc = "Find right surrounding" },
      { "sF", desc = "Find left surrounding" },
      { "sh", desc = "Highlight surrounding" },
      { "sr", desc = "Replace surrounding" },
      { "sn", desc = "Update `MiniSurround.config.n_lines`" },
    },
    opts = { n_lines = 200 },
  },
  {
    "f-person/git-blame.nvim",
    event = "User AstroGitFile",
    init = function() vim.g.gitblame_enabled = false end,
  },
  {
    "alec-gibson/nvim-tetris",
    cmd = { "Tetris" },
    lazy = true,
  },
  {
    "mg979/vim-visual-multi",
    lazy = false,
    init = function() vim.g.VM_mouse_mappings = true end,
  },
  {
    "michaelb/sniprun",
    keys = {},
    lazy = true,
    ft = { "py", "cpp", "java", "c", "rust" },
    opts = {
      display = {
        -- "Classic",
        -- "VirtualTextOk",
        -- "VirtualTextErr",
        -- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText[Ok/Err]
        -- "Terminal",                --# display results in a vertical split
        -- "TerminalWithCode",        --# display results and code history in a vertical split
        "TempFloatingWindow",
      },
      live_display = { "VirtualTextOk" }, --# display mode used in live_mode
      live_mode_toggle = "off", --# live mode toggle, either 'off' or 'enable'
      borders = "double",
    },
    build = "bash ./install.sh 1",
    cmd = "SnipRun",
  },
  {
    "sudoerwx/vim-ray-so-beautiful",
    cmd = { "Ray" },
    init = function()
      -- vim.g.ray_browser = "/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe"
    end,
  },
}
