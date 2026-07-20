-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.dart" },
  { import = "astrocommunity.pack.go" },
  -- Base pack with basedpyright, black and isort
  { import = "astrocommunity.pack.python.base" },
  { import = "astrocommunity.pack.python.basedpyright" },
  { import = "astrocommunity.pack.python.black" },
  { import = "astrocommunity.pack.python.isort" },
  { import = "astrocommunity.pack.java" }, -- modified in plugins/community.lua
  { import = "astrocommunity.pack.bash" }, -- modified in plugins/community.lua
  { import = "astrocommunity.test.neotest" },
  -- { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.biome" },
  { import = "astrocommunity.pack.typescript" },
  -- { import = "astrocommunity.editing-support.refactoring-nvim" },

  { import = "astrocommunity.ai.opencode-nvim" },

  { import = "astrocommunity.recipes.vscode" },
  -- import/override with your plugins folder
}
