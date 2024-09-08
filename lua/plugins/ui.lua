-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    icons = {
      -- LSP
      ActiveLSP = "",
      ActiveTS = "",
      LSPLoaded = "",
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
      -- Git
      Github = "",
      GitAdd = "",
      GitBranch = "",
      GitChange = "",
      GitConflict = "",
      GitDelete = "",
      GitIgnored = "",
      GitRenamed = "",
      GitStaged = "✓",
      GitUnstaged = "✗",
      Neogit = "",
      -- Files
      Ellipsis = "",
      DefaultFile = "",
      FileModified = "",
      FileReadOnly = "",
      FoldClosed = "",
      FoldOpened = "",
      FolderClosed = "",
      FolderEmpty = "",
      FolderOpen = "",
      -- DAP
      DapBreakpoint = "",
      DapBreakpointCondition = "",
      DapBreakpointRejected = "",
      DapLogPoint = "",
      DapStopped = "",
      -- Diagnostics
      Diagnostic = "󰒡",
      DiagnosticError = "",
      DiagnosticHint = "",
      DiagnosticInfo = "󰋼",
      DiagnosticWarn = "",
      -- Misc
      Mode = "󰊠",
      FileEncoding = "",
      ScrollText = "",
      TabWidth = "",
      Search = "",
      Grapple = "󰓹",
      Codeium = "󱚝",
    },
    status = {
      separators = {
        left = { " ", "" }, -- separator for the left side of the statusline
        right = { " ", "" }, -- separator for the right side of the statusline
        -- tab = { "", "" },
      },
      colors = function(hl)
        local get_hlgroup = require("astroui").get_hlgroup
        -- use helper function to get highlight group properties
        hl.text_fg = "#7aa2f7"
        hl.insert = "#c3e88d"
        hl.visual = "#BE98FD"
        hl.replace = "#ea6962"
        hl.terminal = "#a89984"
        hl.file_info_fg = "black"
        hl.file_info_bg = "#7dcfff"
        hl.git_branch_fg = "#3b4261"
        hl.git_branch_bg = "#b4f9f8"
        hl.lsp_fg = "black"
        hl.lsp_bg = "#9d7cd8"
        hl.search_bg = "#ffc777"
        hl.file_encoding_bg = "#f7768e"
        hl.tab_width_bg = "#ff966c"
        hl.nav_fg = "black"
        hl.nav_bg = "#9d7cd8"
        hl.nav_icon_bg = hl.nav_bg
        hl.scrollbar = "#3d59a1"
        return hl
      end,
      attributes = {
        mode = { bold = true },
        file_info = { bold = true },
        git_branch = { bold = true },
        diagnostics = { bold = true },
        git_diff = { bold = true },
        lsp = { bold = true },
      },
    },
  },
}
