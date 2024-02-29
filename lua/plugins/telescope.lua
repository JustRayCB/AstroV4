return {
  "nvim-telescope/telescope.nvim",
  dependencies = { -- add a new dependency to telescope that is our new plugin
    "nvim-telescope/telescope-media-files.nvim",
    "ThePrimeagen/refactoring.nvim",
  },
  -- the first parameter is the plugin specification
  -- the second is the table of options as set up in Lazy with the `opts` key
  config = function(plugin, opts)
    -- run the core AstroNvim configuration function with the options table
    require "astronvim.plugins.configs.telescope"(plugin, opts)

    -- require telescope and load extensions as necessary
    require("telescope").load_extension "media_files"
    -- load refactoring Telescope extension
    require("telescope").load_extension "refactoring"

    vim.keymap.set({ "n", "x" }, "<leader>rr", function() require("telescope").extensions.refactoring.refactors() end)

    -- opts.extensions = {
    --   media_files = {
    --     -- filetypes whitelist
    --     -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
    --     filetypes = { "png", "webp", "jpg", "jpeg", "pdf" },
    --     -- find command (defaults to `fd`)
    --     find_cmd = "rg",
    --   },
    -- }
  end,
}
