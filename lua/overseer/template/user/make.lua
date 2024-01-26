return {
  name = "make",
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand "%:p"
    return {
      cmd = { "make" },
      args = {
        "&&",
        "./main"
      },
      components = {
        -- { "on_output_quickfix", set_diagnostics = true },
        "on_result_diagnostics",
        { "on_complete_notify", statuses = { "FAILURE" } },
        -- timeout = 60,
        "default",
      },
    }
  end,
  condition = {
    filetype = { "cpp", "java"},
  },
}

