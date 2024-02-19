-- if true then return {} end -- REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend settig up the Lua Language Server (lua_ls) as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 100, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
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
      },
    },
  },
}
