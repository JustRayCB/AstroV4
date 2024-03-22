return {
  "ThePrimeagen/refactoring.nvim",
  ft = { "java", "cpp", "c", "h", "hpp", "cxx", "python" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>r"] = { desc = "Refactor" },
            ["<Leader>rI"] = {
              function() require("refactoring").refactor "Inline Function" end,
              desc = "Inline Function refractoring",
            },
            ["<Leader>ri"] = {
              function() require("refactoring").refactor "Inline Variable" end,
              desc = "Inline Variable refractoring",
            },
            ["<Leader>rb"] = {
              function() require("refactoring").refactor "Extract Block" end,
              desc = "Extract Block refractoring",
            },
            ["<Leader>rbf"] = {
              function() require("refactoring").refactor "Extract Block To File" end,
              desc = "Extract Block To File refractoring",
            },
            --- @diagnostic disable: missing-fields
            ["<Leader>rp"] = {
              function() require("refactoring").debug.printf { below = true } end,
              desc = "Debug printf",
            },
            ["<Leader>rv"] = {
              function() require("refactoring").debug.print_var() end,
              desc = "Debug print var",
            },
            ["<Leader>rc"] = {
              function() require("refactoring").debug.cleanup {} end,
              desc = "Debug cleanup print statements",
            },
          },
          x = {
            ["<Leader>re"] = {
              function() require("refactoring").refactor "Extract Function" end,
              desc = "Extract Function refractoring",
            },
            ["<Leader>rf"] = {
              function() require("refactoring").refactor "Extract Function To File" end,
              desc = "Extract Function To File refractoring",
            },
            ["<Leader>rv"] = {
              function() require("refactoring").refactor "Extract Variable" end,
              desc = "Extract Variable refractoring",
            },
          },
        },
      },
    },
  },
  config = function()
    require("refactoring").setup {
      prompt_func_return_type = {
        java = true,

        cpp = true,
        c = true,
        h = true,
        hpp = true,
        cxx = true,
      },
      prompt_func_param_type = {
        java = true,

        cpp = true,
        c = true,
        h = true,
        hpp = true,
        cxx = true,
      },
      printf_statements = {},
      print_var_statements = {},
      show_success_message = true, -- shows a message with information about the refactor on success
      -- i.e. [Refactor] Inlined 3 variable occurrences
    }
  end,
}
