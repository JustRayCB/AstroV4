return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      group_empty_dirs = true,
    },
    event_handlers = {
      {
        event = "neo_tree_popup_input_ready",
        ---@param args { bufnr: integer, winid: integer }
        handler = function(args)
          -- map <esc> to enter normal mode (by default closes prompt)
          -- don't forget `opts.buffer` to specify the buffer of the popup.
          vim.keymap.set("i", "jj", "<Esc>`^", { noremap = true, buffer = args.bufnr })
          vim.keymap.set("i", "<esc>", "<Esc>`^", { noremap = true, buffer = args.bufnr })
        end,
      },
    },
  },
}
