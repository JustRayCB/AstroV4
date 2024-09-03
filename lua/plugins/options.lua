-- if true then return {} end -- REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = off)
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        -- wrap = false, -- sets vim.opt.wrap
        colorcolumn = "100",
        virtualedit = "onemore",
        completeopt = "menuone,preview",
        autoindent = true,
        smartindent = false, -- cause weird indent behavior by inserting #
        smarttab = true,
        filetype = "none", -- Defaut ft when no extension,
        undofile = true,
        undodir = os.getenv "HOME" .. "/.local/share/AstroNvim/tmp/undodir",
        writebackup = false,
        backup = true,
        backupdir = os.getenv "HOME" .. "/.local/share/AstroNvim/tmp/backupdir",
        swapfile = true,
        directory = os.getenv "HOME" .. "/.local/share/AstroNvim/tmp/swap",
        autochdir = false, -- Change directory to current file
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        ultimate_autopair_enabled = true,
        diagnostics_mode = 3,
        python3_host_prog = "/usr/bin/python3",
        -- nonels_supress_issue58 = true,
      },
    },
    rooter = {
      -- list of detectors in order of prevalence, elements can be:
      --   "lsp" : lsp detection
      --   string[] : a list of directory patterns to look for
      --   fun(bufnr: integer): string|string[] : a function that takes a buffer number and outputs detected roots
      detector = {
        "lsp", -- highest priority is getting workspace from running language servers
        { ".git", "_darcs", ".hg", ".bzr", ".svn" }, -- next check for a version controlled parent directory
        { "lua", "Makefile", "package.json", "pom.xml" }, -- lastly check for known project root files
      },
      -- ignore things from root detection
      ignore = {
        servers = { "clangd" }, -- list of language server names to ignore (Ex. { "efm" })
        dirs = {}, -- list of directory patterns (Ex. { "~/.cargo/*" })
      },
      -- automatically update working directory (update manually with `:AstroRoot`)
      autochdir = true,
      -- scope of working directory to change ("global"|"tab"|"win")
      scope = "global",
      -- show notification on every working directory change
      notify = false,
    },
  },
}
