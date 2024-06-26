-- if true then return {} end -- REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.java" }, -- modified in plugins/community.lua
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.html-css" },
  -- { import = "astrocommunity.pack.sql" },
  -- { import = "astrocommunity.code-runner.compiler-nvim" },
  -- { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.test.neotest" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.editing-support.nvim-devdocs" },
  { import = "astrocommunity.file-explorer.telescope-file-browser-nvim" },
  -- { import = "astrocommunity.lsp.garbage-day-nvim" },
  -- import/override with your plugins folder
}
