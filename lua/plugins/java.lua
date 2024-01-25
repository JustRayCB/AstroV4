return {
  { "mfussenegger/nvim-jdtls", lazy = true }, -- load jdtls on module
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      setup_handlers = {
        -- add custom handler
        jdtls = function(_, opts)
          vim.api.nvim_create_autocmd("Filetype", {
            pattern = "java", -- autocmd to start jdtls
            callback = function()
              if opts.root_dir and opts.root_dir ~= "" then require("jdtls").start_or_attach(opts) end
            end,
          })
        end,
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "jdtls" },
    },
  },
}
