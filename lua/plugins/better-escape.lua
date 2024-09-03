return {
  {
    "max397574/better-escape.nvim",
    -- enabled = false
    config = function(plugin, opts)
      -- require "plugins.configs.better-escape"(plugin, opts)
      require("better_escape").setup {
        timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
        -- default_mappings = false, -- weird behavior
        mappings = {
          i = {
            j = {
              -- These can all also be functions
              -- j = "<Esc>`^",
              j = function()
                vim.api.nvim_input "<Esc>`^"
                local current_line = vim.api.nvim_get_current_line()
                if current_line:match "^%s+j$" then vim.schedule(function() vim.api.nvim_set_current_line "" end) end
              end,
            },
          },
        },
        -- example(recommended)
        -- keys = function()
        --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
        -- end,
      }
    end,
  },
}
