-- You can also add new plugins here as well using the lazy syntax:
---@type LazySpec
return {
  {
    "IogaMaster/neocord",
    enabled = false,
    event = "VeryLazy",
    opts = {
      -- General options
      logo = "auto", -- "auto" or url
      logo_tooltip = nil, -- nil or string
      main_image = "language", -- "language" or "logo"
      client_id = "1157438221865717891", -- Use your own Discord application client id (not recommended)
      log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
      debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
      blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
      file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
      show_time = true, -- Show the timer
      global_timer = false, -- if set true, timer won't update when any event are triggered

      -- Rich Presence text options
      editing_text = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
      file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
      git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
      plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
      reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
      workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
      line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
      terminal_text = "Using Terminal", -- Format string rendered when in terminal mode.
    },
  },
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
    enabled = false,
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

  {
    "numToStr/Comment.nvim",
    opts = function(_, opts)
      local ft = require "Comment.ft"
      ft.jflex = { "//%s", "/*%s*/" }
    end,
  },
}
