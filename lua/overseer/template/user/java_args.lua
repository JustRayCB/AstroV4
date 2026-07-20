return {
  name = "Java with Args",
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand "%:p"
    local args = function()
      local args = vim.fn.input "Enter args: "
      local args_list = { file, "&&", "java", vim.fn.expand "%:r" }
      for arg in string.gmatch(args, "%S+") do
        table.insert(args_list, arg)
      end
      return args_list
    end
    return {
      cmd = { "javac" },
      args = args(),
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
