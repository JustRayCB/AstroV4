-- ~/.config/nvim/lua/plugins/dart-indent.lua
return {
  {
    "dart-lang/dart-vim-plugin",
    ft = { "dart" },
    init = function()
      -- vim.g.dart_style_guide = 2
      -- vim.g.dart_trailing_comma_indent = true
    end,
  },
}
