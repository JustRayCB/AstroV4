return {
  {
    "turbio/bracey.vim",
    build = "pnpm install --prefix server",
    ft = { "html", "css", "javascript" },
    init = function()
      vim.g.bracey_browser_command = "wslview"
      vim.g.bracey_auto_start_browser = 1
      vim.g.bracey_refresh_on_save = 1
      vim.g.bracey_eval_on_save = 1
      vim.g.bracey_auto_start_server = 1
      vim.g.bracey_server_allow_remote_connections = 1
    end,
  },
  {
    "ray-x/web-tools.nvim",
    build = "pnpm install -g browser-sync",
    opts = {},
  },
}
