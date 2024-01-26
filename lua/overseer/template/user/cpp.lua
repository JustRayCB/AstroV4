return {
  name = "cpp",
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand "%:p"
    return {
      cmd = { "g++" },
      args = {
        file,
        "-o",
        vim.fn.expand "%:p:r",
        "-std=c++20",
        "-Wall",
        "-Wextra",
        "-Wpedantic",
        "-Werror",
        "-g",
        "&&",
        vim.fn.expand "%:p:r",
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
    filetype = { "cpp" },
  },
}
