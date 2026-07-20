return {
  {
    "max397574/better-escape.nvim",
    opts = {
      timeout = vim.o.timeoutlen,
      mappings = {
        i = {
          j = {
            -- These can all also be functions
            -- j = "<Esc>`^",
            j = function()
              vim.api.nvim_input "<Esc>`^"
              local current_line = vim.api.nvim_get_current_line()
              -- This clean the line if there is nothing on it
              if current_line:match "^%s+j$" then vim.schedule(function() vim.api.nvim_set_current_line "" end) end
            end,
          },
        },
      },
      -- example(recommended)
      -- keys = function()
      --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
      -- end,
    },
  },
}
