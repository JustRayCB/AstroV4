---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",
        "jdtls",
        "clangd",
        -- "typst_lsp",
        -- "basedpyright",
        "tinymist",

        -- install formatters
        "stylua",
        "clang-format",

        -- install debuggers
        "debugpy",
        "cpptools",
        "codelldb",
        "java-debug-adapter",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
