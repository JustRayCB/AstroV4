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
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
    -- opts = {},
    event = { "User AstroFile" },
    cmd = { "TodoQuickFix" },
    keys = {
      { "<leader>T", "<cmd>TodoTelescope<cr>", desc = "Open TODOs with Telescope" },
    },
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
