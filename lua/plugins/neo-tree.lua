return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        ["O"] = {
          function(state)
            local node = state.tree:get_node()
            vim.fn.execute("silent !wslview '" .. node.path .. "'")
          end,
          desc = "System Open",
        },
      },
    },
    filesystem = {
      group_empty_dirs = true,
    },
  },
}
