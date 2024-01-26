return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
    "tpope/vim-dotenv",
  },
  keys = { { "<leader><leader>db", "<cmd>tab DBUI<cr>", desc = "Open Database client" } },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_show_database_icon = 1
    vim.g.db_ui_force_echo_notifications = 1
    vim.g.db_ui_win_position = "left"
    vim.g.db_ui_winwidth = 30
    vim.g.db_ui_save_location = vim.fn.getcwd()
    vim.g.db_ui_execute_on_save = 0

    vim.g.db_ui_table_helpers = {
      mysql = {
        Count = "select count(1) from {optional_schema}{table}",
        Explain = "EXPLAIN {last_query}",
      },
      sqlite = {
        Describe = "PRAGMA table_info({table})",
      },
    }
    --new mappings for dadbod ui
    -- new keymaps <leader>M, that execute <leader>S command  in visual mode
    vim.api.nvim_set_keymap("v", "<leader>s", "<leader>S", { noremap = false })
    vim.api.nvim_set_keymap("n", "<leader>s", "<leader>S", { noremap = false })

    vim.g.db_ui_icons = {
      expanded = {
        db = "▾ ",
        buffers = "▾ ",
        saved_queries = "▾ ",
        schemas = "▾ ",
        schema = "▾ פּ",
        tables = "▾ 󰓱",
        table = "▾ ",
      },
      collapsed = {
        db = "▸ ",
        buffers = "▸ ",
        saved_queries = "▸ ",
        schemas = "▸ ",
        schema = "▸ פּ",
        tables = "▸ 󰓱",
        table = "▸ ",
      },
      saved_query = "",
      new_query = "󰓰",
      tables = "󰓫",
      buffers = "󰮆",
      add_connection = "󰆺",
      connection_ok = "✓",
      connection_error = "✕",
    }
  end,
}
