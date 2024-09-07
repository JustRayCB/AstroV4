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
      colorcolumn = {
        {
          event = "User",
          pattern = "*",
          group = "colorcolumn",
          command = "highlight ColorColumn guibg=Red",
          desc = "Highlight the ColorColumn in Red",
        },
      },

      compile = {
        {
          event = "VimEnter",
          pattern = "*.tex",
          group = "compile",
          -- command = "silent VimtexCompile",
          callback = function()
            vim.cmd "silent VimtexCompile"
            vim.cmd "TSDisable highlight" -- This is a workaround for the bug in nvim-ufo and treesitter delete ts latex
          end,
          desc = "Compile tex file on opening",
        },
        {
          event = "VimEnter",
          pattern = "*.typ",
          group = "compile",
          -- command = "silent TypstWatch",
          -- command = "silent TypstPreview",
          callback = function()
            local filename_no_ext = vim.fn.expand "%:t:r"
            if filename_no_ext == "main" then vim.cmd "silent TypstPreview" end
          end,
          desc = "Compile main typst file on opening",
        },
        {
          event = "VimLeave",
          pattern = "*.typ",
          group = "compile",
          -- command = "silent ! typst compile %",
          callback = function()
            local filename_no_ext = vim.fn.expand "%:t:r"
            if filename_no_ext == "main" then vim.cmd "silent ! typst compile %" end
          end,
        },
      },

      templates = {
        {
          event = "BufNewFile",
          pattern = "*.cpp",
          group = "templates",
          callback = function(args)
            -- I have to load the template this way because this autocmd triggers lazy-loaded plugins
            -- so, this autocmd is re-emitted after the plugin is loaded to capture the command.
            -- Side-effect of lazy loading. Thank Mehalter for this workaround.
            if not vim.b[args.buf].skeleton_added then -- only add the skeleton once
              vim.cmd("silent 0r " .. vim.fn.stdpath "config" .. "/lua/templates/skeleton.cpp")
              vim.b[args.buf].skeleton_added = true -- set the flag to true after first emmission of the command
            end
            -- When the command is re-emitted due to lazy-loaded plugins,
            -- the flag is already set to true, so the command is not executed again
          end,
          desc = "Load cpp template",
        },
      },
    },
  },
}
