return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    config = function()
      local dap = require "dap"

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = require("mason-registry").get_package("codelldb"):get_install_path()
            .. "/extension/adapter/codelldb",
          args = { "--port", "${port}" },
        },
      }
      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            local file_name_without_extension = vim.fn.expand "%:t:r"
            local cwd = vim.fn.getcwd()
            vim.fn.system("g++ -o " .. file_name_without_extension .. " -g -std=c++20 " .. vim.fn.expand "%")
            return vim.fn.getcwd() .. "/" .. file_name_without_extension
          end,
          cwd = "${workspaceFolder}",
          args = {},
          console = "integratedTerminal",
          stopOnEntry = false, -- If true it crash
        },
        {
          name = "Launch file with arguments",
          type = "codelldb",
          request = "launch",
          program = function()
            local file_name_without_extension = vim.fn.expand "%:t:r"
            local cwd = vim.fn.getcwd()
            vim.fn.system("g++ -o " .. file_name_without_extension .. " -g -std=c++20 " .. vim.fn.expand "%")
            return cwd .. "/" .. file_name_without_extension
          end,
          cwd = "${workspaceFolder}",
          args = function()
            local args = vim.fn.input "Enter args: "
            local args_list = {}
            for arg in string.gmatch(args, "%S+") do
              table.insert(args_list, arg)
            end
            return args_list
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

      dap.configurations.java = {
        {
          type = "java",
          request = "attach",
          name = "Debug (Attach) - Remote",
          hostName = "127.0.0.1",
          port = 5005,
          vmArgs = "--enable-preview",
        },
        {
          classpath = {},
          javaExec = "/usr/bin/java",
          modulePaths = {},
          name = "Launch current file",
          request = "launch",
          type = "java",
          cwd = "${workspaceFolder}",
          vmArgs = "--enable-preview",
        },
        {
          classpath = {},
          javaExec = "/usr/bin/java",
          modulePaths = {},
          name = "Launch current file with arugments",
          request = "launch",
          type = "java",
          args = function() return vim.fn.input "Enter args: " end,
          cwd = "${workspaceFolder}",
          vmArgs = "--enable-preview",
        },
      }
      -- dap.configurations.python = {
      --   {
      --     type = "python",
      --     request = "launch",
      --     name = "Launch file CUSTOM",
      --     program = "${file}",
      --     cwd = "${workspaceFolder}",
      --   },
      -- }
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = "mfussenegger/nvim-dap",
    ft = "python", -- NOTE: ft: lazy-load on filetype
    config = function(_, opts)
      local path = require("mason-registry").get_package("debugpy"):get_install_path() .. "/venv/bin/python"
      local cwd = vim.fn.getcwd()
      -- local cwd = "/home/cbr/Unif3/campus_routing/"
      -- opts.DebugpyLaunchConfig.cwd = vim.fn.getcwd()
      require("dap-python").setup(path, opts)
      -- require("dap").configurations.python[0].cwd = vim.fn.getcwd()
      -- print(vim.inspect(require("dap").configurations.python))
      -- require("dap").configurations.python
      for _, tble in ipairs(require("dap").configurations.python) do
        ---@class tble
        if tble ~= nil then tble.cwd = cwd end
      end
      -- print(vim.inspect(require("dap").configurations.python))

      -- print(type(require("dap").configurations.python))
    end,
  },
}
