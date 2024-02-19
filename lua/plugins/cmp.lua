return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-emoji",
    "jc-doyle/cmp-pandoc-references",
    "kdheepak/cmp-latex-symbols",
    "mstanciu552/cmp-octave",
    "hrsh7th/cmp-path",
  },
  opts = function(_, opts)
    -- opts parameter is the default options table
    -- the function is lazy loaded so cmp is able to be required
    local cmp = require "cmp"
    local luasnip = require "luasnip"
    local neogen = require "neogen"
    -- To  fix the issue of tab jumping around "randomly"
    luasnip.config.set_config { -- To fix the issue of tab jumping around "randomly"
      region_check_events = "InsertEnter",
      delete_check_events = "InsertLeave",
      -- update_events = {"TextChanged", "TextChangedI"}
    }
    -- modify the mapping part of the table
    opts.mapping["<CR>"] = cmp.mapping.confirm { select = true }
    opts.mapping["<C-x>"] = cmp.mapping.select_next_item()
    opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_locally_jumpable() or neogen.jumpable() then
        if neogen.jumpable() then
          neogen.jump_next()
        else
          luasnip.expand_or_jump()
        end
      else
        fallback()
      end
    end, { "i", "s" })
    opts.mapping["<C-p>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) or neogen.jumpable(true) then
        if neogen.jumpable(true) then
          neogen.jump_prev()
        else
          luasnip.jump(-1)
        end
      else
        fallback()
      end
    end, { "i", "s" })
    opts.mapping["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select } -- to fix the c-j not working since update 2/05/23
    opts.mapping["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select }

    -- Setup sources priority
    opts.sources = cmp.config.sources {
      { name = "luasnip", priority = 1750 },
      { name = "nvim_lsp", priority = 1000 },
      -- { name = "vim-dadbod-completion", priority = 800 },
      -- { name = "cmp_octave", priority = 800 },
      { name = "pandoc_references", priority = 725 },
      { name = "latex_symbols", priority = 700 },
      { name = "calc", priority = 650 },
      {
        name = "path",
        priority = 500,
        option = {
          trailing_slash = true,
          get_cwd = function()
            local server = require "lspconfig.util"
            local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", ".project" }
            if server then
              if not server.root_pattern(root_markers)(vim.fn.getcwd()) then -- If there I just want to code outside a project
                return vim.fn.getcwd()
              else
                return server.root_pattern(root_markers)(vim.fn.getcwd())
              end
            else
              return vim.fn.getcwd()
            end
          end,
        },
      },
      { name = "buffer", priority = 250 },
      { name = "emoji", priority = 200 },
    }
  end,
}
