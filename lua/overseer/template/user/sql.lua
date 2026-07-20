return {
  name = "sql",
  builder = function()
    -- Full path to current file (see :help expand())
    -- mysql -u cbr --password= --database=student < ./student.sql
    local file = vim.fn.expand "%:p"
    return {
      cmd = { "mysql" },
      args = {
        "-u",
        "cbr",
        "--password=",
        "<",
        file
      },
      components = {
        -- { "on_output_quickfix", set_diagnostics = true },
        "on_result_diagnostics",
        { "on_complete_notify", statuses = { "FAILURE" } },
        "default",
      },
    }
  end,
  inputs = {
    {
      type= "pickString",
      id= "componentType",
      description = "What type of component do you want to create?",
      options = {
        "component",
        "directive",
        "pipe",
        "service",
        "class",
        "guard",
        "interface",
        "enum"
      },
      default ="component"
    },
    {
      type= "promptString",
      id= "componentName",
      description= "Name your component.",
      default= "my-new-component"
    }
  },
  condition = {
    filetype = { "sql" },
  },
}

