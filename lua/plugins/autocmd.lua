return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    autocmds = {
      -- autocommands are organized into augroups for easy management
      -- autohidetabline = {
      --   -- each augroup contains a list of auto commands
      --   {
      --     -- create a new autocmd on the "User" event
      --     event = "User",
      --     -- the pattern is the name of our User autocommand events
      --     pattern = "AstroBufsUpdated", -- triggered when vim.t.bufs is updated
      --     -- nice description
      --     desc = "Hide tabline when only one buffer and one tab",
      --     -- add the autocmd to the newly created augroup
      --     group = "autohidetabline",
      --     callback = function()
      --       -- if there is more than one buffer in the tab, show the tabline
      --       -- if there are 0 or 1 buffers in the tab, only show the tabline if there is more than one vim tab
      --       local new_showtabline = #vim.t.bufs > 1 and 2 or 1
      --       -- check if the new value is the same as the current value
      --       if new_showtabline ~= vim.opt.showtabline:get() then
      --         -- if it is different, then set the new `showtabline` value
      --         vim.opt.showtabline = new_showtabline
      --       end
      --     end,
      --   },
      -- },
      --
      -- colorcolumn = {
      --   {
      --     event = "User",
      --     pattern = "*",
      --     group = "colorcolumn",
      --     command = "highlight ColorColumn guibg=Red",
      --     desc = "Highlight the ColorColumn in Red",
      --   },
      -- },

      templates = {
        {
          event = "BufNewFile",
          pattern = "*.cpp",
          group = "templates",
          command = "silent 0r ~/.vim/templates/skeleton.cpp",
          desc = "Load cpp template",
        },
      },
    },
  },
}
