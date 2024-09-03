return {
  {
    "folke/noice.nvim",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      "folke/edgy.nvim",
    },
    -- event = "VimEnter",
    -- lazy = true,
    opts = {
      -- add any options here
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        progress = {
          enabled = false,
        },
        -- Disabled them cause ther is a conflict with something else
        hover = {
          enabled = false,
        },
        signature = {
          enabled = false,
        },
        message = {
          enabled = false,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      routes = {
        {
          -- TODO: Remove this when the issue is fixed of overseer and nvim-dap is fixed
          -- https://github.com/stevearc/overseer.nvim/issues/307 with AstroNvim
          filter = { event = "msg_show", find = "overseer" },
          opts = { skip = true },
        },
        {
          filter = { error = true, find = "copilot_node_command" },
          opts = { skip = true },
        },
      },
    },
  },
}
