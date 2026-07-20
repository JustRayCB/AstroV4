return {
  name = "Make with Args",
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand "%:p"
    local cwd = vim.fn.expand "%:p:h"
    local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", ".project" }
    local root_dir = function()
      local root = require("lspconfig.util").root_pattern(root_markers)(vim.fn.getcwd())
      if not root then
        return cwd
      else
        return root
      end
    end
    vim.cmd("cd " .. root_dir())
    local args = function()
      local args = vim.fn.input "Enter args: "
      local args_list = { "&&", "./main" }
      for arg in string.gmatch(args, "%S+") do
        table.insert(args_list, arg)
      end
      return args_list
    end
    return {
      cmd = { "make" },
      args = args(),
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
    filetype = { "cpp", "java" },
  },
}
