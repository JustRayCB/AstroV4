return {
  "nvim-telescope/telescope.nvim",
  dependencies = { -- add a new dependency to telescope that is our new plugin
    "KilloPillers/telescope-media-files.nvim", -- using fork of telescope-media-files cause error with pdf
    "ThePrimeagen/refactoring.nvim",
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>fi"] = { "<Cmd>Telescope media_files<CR>", desc = "Open in media files" },
            ["<Leader>rr"] = { "<Cmd>Telescope refactoring refactors<CR>", desc = "Refactor" },
          },
        },
      },
    },
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

    opts.extensions = {
      media_files = {
        -- filetypes whitelist
        -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
        filetypes = { "png", "jpg", "pdf" },
        -- find command (defaults to `fd`)
        find_cmd = "fd",
      },
    }
  end,
}
