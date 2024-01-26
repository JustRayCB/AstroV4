return {
  name = "python",
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand "%:p"
    return {
      cmd = { "python3" },
      args = {
        file,
      },
      components = {
        -- { "on_output_quickfix", set_diagnostics = true }, -- Make cursor go to bottom and cant see result toggleterm
        "on_result_diagnostics",
        { "on_complete_notify", statuses = { "FAILURE" } },
        "default",
      },
    }
  end,
  condition = {
    filetype = { "python", "py" },
  },
}
