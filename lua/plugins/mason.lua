-- Example customization of mason plugins
---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- LSP
        "lua-language-server",
        "jdtls",
        "clangd",
        -- "typst_lsp",
        "basedpyright",
        "tinymist",

        -- FORMATTERS
        "stylua",
        "clang-format",

        -- DAP
        "cpptools",
        "codelldb",
        "debugpy",
        "java-debug-adapter",
      },
      integrations = {
        ["mason-lspconfig"] = false,
        ["mason-null-ls"] = false,
        ["mason-nvim-dap"] = false,
      },
    },
  },
}
