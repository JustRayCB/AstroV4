return {
  "jay-babu/mason-nvim-dap.nvim",
  config = function()
    local dap = require "dap"

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = require("mason-registry").get_package("codelldb"):get_install_path() .. "/extension/adapter/codelldb",
        args = { "--port", "${port}" },
      },
    }
    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = function()
          local file_name_without_extension = vim.fn.expand "%:t:r"
          local cwd = vim.fn.getcwd()
          vim.fn.system("g++ -o " .. file_name_without_extension .. " -g -std=c++20 " .. vim.fn.expand "%")
          return vim.fn.getcwd() .. "/" .. file_name_without_extension
        end,
        cwd = "${workspaceFolder}",
        args = function()
          local ask_args = vim.fn.input "Do you want to enter args? (y/n): "
          if ask_args == "y" then
            local args = vim.fn.input "Enter args: "
            local args_list = {}
            for arg in string.gmatch(args, "%S+") do
              table.insert(args_list, arg)
            end
            return args_list
          else
            return {}
          end
        end,
        console = "integratedTerminal",
        stopOnEntry = false, -- If true it crash
      },
      {
        name = "Launch Make",
        type = "codelldb",
        request = "launch",
        program = function()
          vim.fn.system "make"
          return vim.fn.getcwd() .. "/main"
        end,
        args = function()
          local ask_args = vim.fn.input "Do you want to enter args? (y/n): "
          if ask_args == "y" then
            local args = vim.fn.input "Enter args: "
            local args_list = {}
            for arg in string.gmatch(args, "%S+") do
              table.insert(args_list, arg)
            end
            return args_list
          else
            return {}
          end
        end,
        console = "integratedTerminal",
        cwd = "${workspaceFolder}",
        stopOnEntry = false, -- If true it crash
      },
    }
  end,
}
