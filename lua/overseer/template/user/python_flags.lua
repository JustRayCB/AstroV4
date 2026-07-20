return {
  name = "Python with flags",
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand "%:p"
    local args = function()
      local args = vim.fn.input "Enter flags: "
      local args_list = {}
      for arg in string.gmatch(args, "%S+") do
        table.insert(args_list, arg)
      end
      table.insert(args_list, file)
      return args_list
    end
    return {
      cmd = { "python3" },
      args = args(),
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
