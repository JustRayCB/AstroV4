return {
  "rebelot/heirline.nvim",
  dependencies = {
    { -- configure AstroUI to include a new UI icon
      "AstroNvim/astroui",
      ---@type AstroUIOpts
      opts = {
        icons = {
          Clock = "", -- add icon for clock
        },
      },
    },
  },
  opts = function(_, opts)
    local status = require "astroui.status"
    local get_icon = require("astroui").get_icon
    local is_available = require("astrocore").is_available
    local path_func = status.provider.filename { modify = ":.:h", fallback = "" }
    opts.statusline = {
      hl = { fg = "fg", bg = "bg" },
      -- Show mode text
      status.component.mode {
        -- enable mode text with padding as well as an icon before it
        mode_text = {
          icon = { kind = "Mode", padding = { left = 0, right = 1 } },
        },
        -- surround the component with a separators
        surround = {
          separator = "left",
        },
      },
      status.component.file_info {
        file_icon = { padding = { left = 0, right = 1 } },
        filename = { fallback = "Empty" },
        filetype = false,
        file_modified = false,
        surround = {
          separator = "left",
        },
      },
      status.component.git_branch {
        padding = { left = 2, right = 1 },
        surround = {
          separator = "left",
        },
      },
      -- Add a icon to represent diagnostic and git git diff
      status.component.builder {
        provider = function() return get_icon "Diagnostic" .. "/" .. get_icon "Github" end,
        hl = { fg = "black" },
        surround = {
          separator = "left",
          color = "#c0caf5",
        },
      },
      status.component.diagnostics {
        surround = {
          separator = "none",
          color = "bg",
        },
      },
      status.component.git_diff {
        padding = { left = 1 },
        surround = {
          separator = "none",
          color = "bg",
        },
      },
      status.component.fill(),
      -- Create a custom component to display the time
      status.component.builder {
        {
          provider = function()
            local time = os.date "%H:%M" -- show hour and minute in 24 hour format
            ---@cast time string
            return status.utils.stylize(time, {
              icon = { kind = "Clock", padding = { right = 1 } }, -- use our new clock icon
              padding = { right = 1 }, -- pad the right side so it's not cramped
            })
          end,
        },
        update = { -- update should happen when the mode has changed as well as when the time has changed
          "User", -- We can use the User autocmd event space to tell the component when to update
          "ModeChanged",
          callback = vim.schedule_wrap(function(_, args)
            if -- update on user UpdateTime event and mode change
              (args.event == "User" and args.match == "UpdateTime")
              or (args.event == "ModeChanged" and args.match:match ".*:.*")
            then
              vim.cmd.redrawstatus() -- redraw on update
            end
          end),
        },
        hl = status.hl.get_attributes "mode", -- highlight based on mode attributes
        surround = { separator = "left", color = status.hl.mode_bg }, -- background highlight based on mode
      },
      status.component.fill(),
      -- Show search counts and results
      {
        condition = function(self)
          local query = vim.fn.getreg "/"
          if query == "" then return false end
          query = query:gsub([[^\V]], "")
          query = query:gsub([[\<]], ""):gsub([[\>]], "")

          local search_count = vim.fn.searchcount { recompute = 1, maxcount = -1 }
          if search_count.total == 0 then return false end

          self.query = query
          self.count = search_count
          return true
        end,
        status.component.builder {
          provider = function(self)
            return status.utils.stylize(" " .. self.query .. " " .. self.count.current .. "/" .. self.count.total, {
              icon = { kind = "Search" },
            })
          end,
          hl = { fg = "black" },
          surround = {
            separator = "left",
            color = "search_bg",
          },
        },
      },
      -- Show file encoding
      -- Show Codeium status
      status.component.lsp {
        lsp_client_names = {
          icon = { kind = "ActiveLSP", padding = { right = 1 } },
        },
        surround = { separator = "left" },
      },
      status.component.virtual_env(),
      status.component.builder {
        provider = function()
          return status.utils.stylize(string.upper(vim.bo.fileencoding), {
            icon = { kind = "FileEncoding", padding = { left = 1, right = 1 } },
          })
        end,
        hl = { fg = "text_fg" },
        padding = { right = 1 },
      },
      {
        status.component.builder {
          { provider = get_icon "ScrollText" },
          padding = { right = 1 },
          -- hl = { fg = "black" },
          update = { -- update should happen when the mode has changed as well as when the time has changed
            "User", -- We can use the User autocmd event space to tell the component when to update
            "ModeChanged",
            callback = vim.schedule_wrap(function(_, args)
              if -- update on user UpdateTime event and mode change
                (args.event == "User") or (args.event == "ModeChanged" and args.match:match ".*:.*")
              then
                vim.cmd.redrawstatus() -- redraw on update
              end
            end),
          },
          hl = status.hl.get_attributes "mode", -- highlight based on mode attributes
          surround = {
            separator = { " ", "" },
            color = status.hl.mode_bg,
          }, -- background highlight based on mode
        },
        status.component.nav {
          update = { -- update should happen when the mode has changed as well as when the time has changed
            "User", -- We can use the User autocmd event space to tell the component when to update
            "ModeChanged",
            "CursorMoved",
            "CursorMovedI",
            "BufEnter",
            callback = vim.schedule_wrap(function(_, args)
              if -- update on user UpdateTime event and mode change
                (args.event == "User")
                or (args.event == "ModeChanged" and args.match:match ".*:.*")
                or (args.event == "CursorMoved" or args.event == "CursorMovedI" or args.event == "BufEnter")
              then
                vim.cmd.redrawstatus() -- redraw on update
              end
            end),
          },
          surround = { separator = { "", "" }, color = status.hl.mode_bg },
          -- hl = status.hl.get_attributes "mode", -- highlight based on mode attributes
        },
      },
    }
    -- opts.winbar = {
    --   -- store the current buffer number
    --   init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
    --   fallthrough = false, -- pick the correct winbar based on condition
    --   -- inactive winbar
    --   {
    --     condition = function() return not status.condition.is_active() end,
    --     -- show the path to the file relative to the working directory
    --     status.component.separated_path { path_func = path_func },
    --     -- add the file name and icon
    --     status.component.file_info {
    --       file_icon = { hl = status.hl.file_icon "winbar", padding = { left = 0 } },
    --       filename = {},
    --       filetype = false,
    --       file_modified = false,
    --       file_read_only = false,
    --       hl = status.hl.get_attributes("winbarnc", true),
    --       surround = false,
    --       update = "BufEnter",
    --     },
    --   },
    --   -- active winbar
    --   {
    --     -- show the path to the file relative to the working directory
    --     status.component.separated_path { path_func = path_func },
    --     -- add the file name and icon
    --     status.component.file_info { -- add file_info to breadcrumbs
    --       file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
    --       filename = {},
    --       filetype = false,
    --       file_modified = false,
    --       file_read_only = false,
    --       hl = status.hl.get_attributes("winbar", true),
    --       surround = false,
    --       update = "BufEnter",
    --     },
    --     -- show the breadcrumbs
    --     status.component.breadcrumbs {
    --       icon = { hl = true },
    --       hl = status.hl.get_attributes("winbar", true),
    --       prefix = true,
    --       padding = { left = 0 },
    --     },
    --   },
    -- }

    -- Now that we have the component, we need a timer to emit the User UpdateTime event
    -- vim.uv.new_timer():start( -- timer for updating the time
    --   (60 - tonumber(os.date "%S")) * 1000, -- offset timer based on current seconds past the minute
    --   60000, -- update every 60 seconds
    --   vim.schedule_wrap(function()
    --     vim.api.nvim_exec_autocmds( -- emit our new User event
    --       "User",
    --       { pattern = "UpdateTime", modeline = false }
    --     )
    --   end)
    -- )
  end,
}
