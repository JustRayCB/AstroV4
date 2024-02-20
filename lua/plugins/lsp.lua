-- if true then return {} end -- REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      autoformat = true, -- enable or disable auto formatting on start
      codelens = true, -- enable/disable codelens refresh on start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = off)
      inlay_hints = true, -- enable/disable inlay hints on start
      lsp_handlers = true, -- enable/disable setting of lsp_handlers
      semantic_tokens = true, -- enable/disable semantic token highlighting
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- " lua_ls ",
        "jsonls", -- Conflict with jsonls
        "jdtls", -- Conflict with clang_format
      },
      timeout_ms = 3200, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--suggest-missing-includes",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--fallback-style=Chromium",
        },
        init_options = {
          clangdFileStatus = true,
          usePlaceholders = true,
          completeUnimported = true,
        },
        capabilities = { offsetEncoding = "utf-8" },
      },
      typst_lsp = {
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern("typst.toml", ".git")(fname) or vim.fn.getcwd()
        end,
        settings = {
          exportPdf = "never", -- Choose onType, onSave or never.
          -- serverPath = "" -- Normally, there is no need to uncomment it.
        },
      },
    },
    -- customize how language servers are attached
    setup_handlers = {
      -- a function without a key is simply the default handler, functions take two parameters, the server name and the configured options table for that server
      -- function(server, opts) require("lspconfig")[server].setup(opts) end

      -- the key is the server that is being setup with `lspconfig`
      -- rust_analyzer = false, -- setting a handler to false will disable the set up of that language server
      -- pyright = function(_, opts) require("lspconfig").pyright.setup(opts) end -- or a custom handler function can be passed
    },
    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {
        gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },
        -- a `cond` key can provided as the string of a server capability to be required to attach, or a function with `client` and `bufnr` parameters from the `on_attach` that returns a boolean
        -- gD = {
        --   function() vim.lsp.buf.declaration() end,
        --   desc = "Declaration of current symbol",
        --   cond = "textDocument/declaration",
        -- },
        -- ["<leader>uY"] = {
        --   function() require("astrolsp.toggles").buffer_semantic_tokens() end,
        --   desc = "Toggle LSP semantic highlight (buffer)",
        --   cond = function(client) return client.server_capabilities.semanticTokensProvider and vim.lsp.semantic_tokens end,
        -- },
        -- Restart LSP ser ver
        ["<leader>rl"] = { "<cmd>LspRestart<cr>", desc = "Restart LSP server" },
        ["<leader>o"] = {
          function()
            local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", ".project" }
            local root_dir = function()
              if not require("lspconfig.util").root_pattern(root_markers)(vim.fn.getcwd()) then -- If there I just want to code outside a project
                return vim.fn.getcwd()
              else
                return require("lspconfig.util").root_pattern(root_markers)(vim.fn.getcwd())
              end
            end
            vim.cmd("cd " .. root_dir())
            require("telescope.builtin").find_files {
              prompt_title = "Fichiers",
              attach_mappings = function(_, map)
                map("i", "<CR>", function(prompt_bufnr)
                  local picker = prompt_bufnr
                  local selection = require("telescope.actions.state").get_selected_entry()
                  vim.fn.execute("silent !wslview '" .. selection.path .. "'")
                  require("telescope.actions").close(picker)
                end)
                return true
              end,
            }
          end,
          desc = "Open file with wslview from the root of the project",
        },
        ["<leader>fu"] = { "<cmd>Telescope lsp_document_symbols<cr>", desc = "Telescope LSP documents symbols " },
      },
    },
  },
}
