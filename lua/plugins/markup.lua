return {
  {
    "wallpants/github-preview.nvim",
    cmd = { "GithubPreviewToggle" },
    keys = { "<leader>mpt" },
    opts = {
      -- config goes here
      host = "localhost",

      -- port used by local server
      port = 6041,

      -- set to "true" to force single-file mode & disable repository mode
      single_file = false,

      theme = {
        -- "system" | "light" | "dark"
        name = "system",
        high_contrast = false,
      },

      -- define how to render <details> tags on init/content-change
      -- true: <details> tags are rendered open
      -- false: <details> tags are rendered closed
      details_tags_open = true,

      cursor_line = {
        disable = true,

        -- CSS color
        -- if you provide an invalid value, cursorline will be invisible
        color = "#c86414",
        opacity = 0.2,
      },

      scroll = {
        disable = false,

        -- Between 0 and 100
        -- VERY LOW and VERY HIGH numbers might result in cursorline out of screen
        top_offset_pct = 35,
      },

      -- for debugging
      -- nil | "debug" | "verbose"
      log_level = nil,
    },
    config = function(_, opts)
      local gpreview = require "github-preview"
      gpreview.setup(opts)

      local fns = gpreview.fns
      vim.keymap.set("n", "<leader>mpt", fns.toggle)
      vim.keymap.set("n", "<leader>mps", fns.single_file_toggle)
      vim.keymap.set("n", "<leader>mpd", fns.details_tags_toggle)
    end,
  },
  {
    "lervag/vimtex",
    enabled = false,
    lazy = true,
    ft = { "tex" },
    event = { "VimEnter *.tex" },
    config = function()
      -- vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_view_general_viewer = "/mnt/c/Users/Craya/AppData/Local/SumatraPDF/SumatraPDF.exe"
      vim.g.tex_flavor = "latex"
      vim.g.Tex_DefaultTargetFormat = "pdf"
      vim.g.Tex_ViewRule_pdf = "sumatraPDF"
      vim.g.vimtex_quickfix_mode = 2
      vim.g.vimtex_quickfix_enabled = 1
      vim.g.vimtex_quickfix_open_on_warning = 1
      vim.g.vimtex_quickfix_open_on_error = 1
      vim.g.show_suggestions = 1
      vim.g.vimtex_compiler_silent = true
      vim.api.nvim_set_keymap("n", "toc", "<cmd>VimtexTocOpen<cr>", { noremap = true, silent = true })
      -- vim.g.vimtex_toc_width = 10
      vim.g.vimtex_toc_config = {
        split_width = 30,
        layer_status = {
          content = 1,
          label = 0,
          todo = 1,
          include = 1,
        },
        show_help = 1,
        -- hide help
        -- split_pos = "right",
        -- toc_open_cmd = "30vnew",
        -- toc_close_cmd = "q",
        -- toc_open_cmd_conceal = "leftabove vertical 30vnew",
        -- toc_close_cmd_conceal = "q",
      }
      vim.g.vimtex_compiler_latexmk = {
        -- build_dir = "build",
        -- continuous = 1,
        -- callback = 1,
        -- executable = "latexmk",
        -- options = {
        --   "-pdf",
        --   "-interaction=nonstopmode",
        --   "-synctex=1",
        --   "-file-line-error",
        --   "-outdir=build",
        -- },
        build_dir = "build",
        callback = 1,
        continuous = 1,
        -- executable = "latexmk",
        executable = "latexmk",
        hooks = {},
        options = {
          "-pdf",
          "-pvc",
          "-verbose",
          "-file-line-error",
          "-synctex=0",
          "-interaction=nonstopmode",
          "--shell-escape",
          -- "-shell-escape",
          -- "--output-directory=build",
          "-auxdir=build",
        },
      }
    end,
  },
  {
    -- Cause the closing ( or } to be more indented than the opening one.
    enabled = true,
    "kaarmu/typst.vim",
    -- cmd = { "TypstWatch" },
    ft = "typst",
    init = function()
      vim.g.typst_pdf_viewer = "evince"
      -- vim.g.typst_pdf_viewer = "kitten @launch --location=vsplit fancy-cat main.pdf"
      vim.g.typst_conceal = 1
      vim.g.typst_conceal_emoji = false
      -- vim.g.typst_conceal_math = true
      vim.g.typst_embedded_languages = { "latex", "cpp", "java", "python", "bash" }
    end,
  },
  {
    "chomosuke/typst-preview.nvim",
    cmd = { "TypstPreview" },
    ft = "typst",
    version = "1.2.*", -- use the latest by default
    build = function() require("typst-preview").update() end,
    opts = {
      dependencies_bin = {
        ["tinymist"] = "tinymist",
      },
    },
  },
}
