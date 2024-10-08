-- You can also add new plugins here as well using the lazy syntax:
---@type LazySpec
return {
  -- "andweeb/presence.nvim",
  {
    "NvChad/nvim-colorizer.lua",
    -- opts = {
    --   user_default_options = {
    --     RGB = true, -- #RGB hex codes
    --     RRGGBB = true, -- #RRGGBB hex codes
    --     names = true, -- "Name" codes like Blue or blue
    --     RRGGBBAA = false, -- #RRGGBBAA hex codes
    --     AARRGGBB = false, -- 0xAARRGGBB hex codes
    --     rgb_fn = true, -- CSS rgb() and rgba() functions
    --     hsl_fn = true, -- CSS hsl() and hsla() functions
    --     css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    --     css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    --     -- Available modes for `mode`: foreground, background,  virtualtext
    --     mode = "virtualtext", -- Set the display mode.
    --     -- Available methods are false / true / "normal" / "lsp" / "both"
    --     -- True is same as normal
    --     tailwind = false, -- Enable tailwind colors
    --     -- parsers can contain values used in |user_default_options|
    --     sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
    --     virtualtext = "■",
    --     -- update color values even if buffer is not focused
    --     -- example use: cmp_menu, cmp_docs
    --     -- always_update = true,
    --   },
    -- },
  },
  {
    "echasnovski/mini.splitjoin",
    event = "User AstroFile",
    opts = {
      mappings = {
        toggle = "<leader>m",
        split = "<leader>j",
        join = "<leader>k",
      },
    },
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      highlight = {
        comments_only = false,
      },
    },
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
    init = function() vim.g.VM_mouse_mappings = true end,
    keys = { "<C-LeftMouse>" },
  },
  {
    "michaelb/sniprun",
    keys = {},
    lazy = true,
    ft = { "python", "cpp", "java", "c", "rust" },
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
