-- if true then return {} end -- REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Example customization of Null-LS sources
---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
      -- null_ls.builtins.diagnostics.checkstyle.with {
      --   extra_args = { "-c", "/sun_checks.xml" }, -- or "/sun_checks.xml" or path to self written rules
      -- },
      null_ls.builtins.code_actions.refactoring.with {
        filetypes = { "lua", "python", "java", "cpp" },
      },
      -- null_ls.builtins.diagnostics.sqlfluff.with {
      --   extra_args = { "--dialect", "sqlite" }, -- change to your dialect
      --   filetypes = { "sql", "mysql" },
      -- },
    }
    return config -- return final config table
  end,
}
