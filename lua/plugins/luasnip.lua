return {
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      -- include the default astronvim config that calls the setup call
      require "astronvim.plugins.configs.luasnip"(plugin, opts)
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = { vim.fn.stdpath "config" .. "/lua/snippets" },
      }
    end,
  },
  {
    "saghen/blink.cmp",
    version = "1.*",
    -- `main` is untested, please open a PR if you've confirmed it works as expected
    dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
    opts = {
      snippets = { preset = "luasnip" },
    },
  },
}
