return {
  name = "java",
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand "%:p"
    return {
      cmd = { "javac" },
      args = {
        file,
        "&&",
        -- "echo",
        -- file,
        "java",
        vim.fn.expand "%:r",
      },
      components = {
        -- { "on_output_quickfix", set_diagnostics = true },
        "on_result_diagnostics",
        { "on_complete_notify", statuses = { "FAILURE" } },
        "default",
      },
    }
  end,
  condition = {
    filetype = { "java" },
  },
}
