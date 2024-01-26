-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/options.lua
-- Add any additional options here

-- vim.opt.relativenumber = true -- sets vim.opt.relativenumber
-- vim.opt.number = true -- sets vim.opt.number
-- vim.opt.spell = false -- sets vim.opt.spell
-- vim.opt.signcolumn = "auto" -- sets vim.opt.signcolumn to auto (auto:1-5)
-- vim.opt.wrap = false -- sets vim.opt.wrap
vim.opt.colorcolumn = "100"
vim.opt.virtualedit = "onemore"
vim.opt.completeopt = "menuone,preview"
vim.opt.smarttab = true -- insert spaces instead of tabs
vim.opt.tabstop = 4 -- number of spaces a tab counts for
vim.opt.shiftwidth = 0
vim.opt.softtabstop = -1
vim.opt.expandtab = false
-- vim.opt.ts = 4
-- vim.opt.sw = 4
-- vim.opt.ai = true
vim.opt.smartindent = true -- before false
vim.opt.filetype = "none" -- Defaut ft when no extension
vim.opt.undofile = true
vim.opt.undodir = os.getenv "HOME" .. "/.local/share/AstroNvim/tmp/undodir"
vim.opt.backupdir = os.getenv "HOME" .. "/.local/share/AstroNvim/tmp/backupdir"
vim.opt.directory = os.getenv "HOME" .. "/.local/share/AstroNvim/tmp/swap"
vim.opt.autochdir = false -- Change directory to current file

-- vim.g.mapleader = " " -- sets vim.g.mapleader
-- vim.g.icons_enabled = false -- disable icons in the UI (disable if no nerd font is available)
vim.g.ultimate_autopair_enabled = true
vim.g.diagnostics_mode = 3
