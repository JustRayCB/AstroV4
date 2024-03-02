return {
  -- install with yarn or npm
  {
    "iamcco/markdown-preview.nvim",
    -- cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },
  {
    "lervag/vimtex",
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
      vim.g.vimtex_quickfix_open_on_warning = 0
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
    "aspeddro/pandoc.nvim",
    event = { "VimEnter *.md" },
    config = function()
      -- code
      require("pandoc").setup {
        commands = {
          name = "PandocBuild",
        },
        default = {
          output = "%s_output.pdf",
        },
        mappings = {
          -- normal mode
          n = {
            ["<leader>pr"] = function()
              local name = vim.fn.input "Output file name: "
              require("pandoc.render").file {
                { "--toc" },
                { "--from", "gfm" },
                -- { "-t latex"},
                { "--output", name .. ".pdf" },
                { "--variable", "colorlinks" },
                { "--variable", "linkcolor:blude" },
                { "--variable", "geometry:margin=2cm" },
                { "--variable", "geometry:a4paper" },
                { "--variable", "mainfont=DejaVu Serif" },
                { "--variable", "monofont=DejaVu Sans Mono" },
                { "--pdf-engine", "xelatex" },
                -- { "--metadata", "date", "$(date '+%B %e, %Y')" }, --does not work
              }
            end,
          },
        },
      }
    end,
  },
  {
    -- Cause the closing ( or } to be more indented than the opening one.
    enabled = true,
    "kaarmu/typst.vim",
    ft = "typst",
    lazy = false,
    init = function()
      vim.g.typst_pdf_viewer = "/mnt/c/Users/Craya/AppData/Local/SumatraPDF/SumatraPDF.exe"
      vim.g.typst_conceal = 1
      -- vim.g.typst_conceal_emoji = true
      -- vim.g.typst_conceal_math = true
      vim.g.typst_embedded_languages = { "latex", "cpp", "java", "python", "bash" }
    end,
  },
  {
    "chomosuke/typst-preview.nvim",
    -- lazy = false, -- or ft = 'typst'
    ft = "typst",
    version = "0.1.*",
    build = function() require("typst-preview").update() end,
  },
}
