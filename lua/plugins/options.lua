-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 200048 * 256, lines = 1000000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    treesitter = {
      -- Globally enable or disable treesitter features
      -- can be:
      --   - a boolean
      --   - a function (`fun(lang: string, bufnr: integer): boolean`)
      enabled = function(lang, bufnr) return not require("astrocore.buffer").is_large(bufnr) end,
      -- Enable or disable treesitter based highlighting
      -- can be:
      --   - a boolean
      --   - a function (`fun(lang: string, bufnr: integer): boolean`)
      highlight = true,
      -- Enable or disable treesitter based indenting
      -- can be:
      --   - a boolean
      --   - a function (`fun(lang: string, bufnr: integer): boolean`)
      indent = true,
      -- List of treesitter parsers that should be installed automatically
      -- ("all" can be used to install all available parsers)
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "json",
        "python",
        "java",
        "cpp",
        "c",
        "markdown",
        "javascript",
        "bibtex",
        "css",
        "html",
        "sql",
      },
      -- Automatically detect missing treesitter parser and install when editing file
      auto_install = true,
      -- Configure treesitter based text objects (requires `nvim-treesitter-textobjects`)
      -- These options set up automatic detection of available queries for a file and creates
      -- only the available bindings for each buffer.
      textobjects = {
        select = {
          select_textobject = {
            ["af"] = { query = "@function.outer", desc = "around function" },
            ["ak"] = { query = "@block.outer", desc = "around block" },
            ["if"] = { query = "@function.inner", desc = "around function" },
          },
        },
        move = {
          goto_next_start = {
            ["]f"] = { query = "@function.outer", desc = "Next function start" },
          },
          goto_next_end = {
            ["]F"] = { query = "@function.outer", desc = "Next function end" },
          },
          goto_previous_start = {
            ["[f"] = {
              query = "@function.outer",
              desc = "Previous function start",
            },
          },
          goto_previous_end = {
            ["[F"] = {
              query = "@function.outer",
              desc = "Previous function end",
            },
          },
        },
        swap = {
          swap_next = {
            [">F"] = { query = "@function.outer", desc = "Swap next function" },
          },
          swap_previous = {
            ["<F"] = {
              query = "@function.outer",
              desc = "Swap previous function",
            },
          },
        },
      },
    },
    -- passed to `vim.filetype.add`
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        colorcolumn = "100",
        virtualedit = "onemore",
        completeopt = "menuone,preview",
        undofile = true,
        undodir = os.getenv "HOME" .. "/.local/share/AstroNvim/tmp/undodir",
        writebackup = false,
        backup = true,
        backupdir = os.getenv "HOME" .. "/.local/share/AstroNvim/tmp/backupdir",
        swapfile = true,
        directory = os.getenv "HOME" .. "/.local/share/AstroNvim/tmp/swap",
        autochdir = false, -- Change directory to current file
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        ultimate_autopair_enabled = true,
        diagnostics_mode = 3,
        python3_host_prog = "/usr/bin/python3",
        java_home = os.getenv "HOME" .. "/.sdkman/candidates/java/current",
      },
    },
    rooter = {
      -- list of detectors in order of prevalence, elements can be:
      --   "lsp" : lsp detection
      --   string[] : a list of directory patterns to look for
      --   fun(bufnr: integer): string|string[] : a function that takes a buffer number and outputs detected roots
      detector = {
        "lsp", -- highest priority is getting workspace from running language servers
        { ".git", "_darcs", ".hg", ".bzr", ".svn" }, -- next check for a version controlled parent directory
        { "lua", "Makefile", "package.json", "pom.xml" }, -- lastly check for known project root files
      },
      -- ignore things from root detection
      ignore = {
        servers = { "clangd" }, -- list of language server names to ignore (Ex. { "efm" })
        dirs = {}, -- list of directory patterns (Ex. { "~/.cargo/*" })
      },
      -- automatically update working directory (update manually with `:AstroRoot`)
      autochdir = true,
      -- scope of working directory to change ("global"|"tab"|"win")
      scope = "global",
      -- show notification on every working directory change
      notify = false,
    },
  },
}
