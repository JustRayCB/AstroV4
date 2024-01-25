-- if true then return {} end -- REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      colorscheme = "tokyonight-moon", -- change colorscheme
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function()
      require("tokyonight").setup {

        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = true },
          keywords = { italic = true },
          functions = { italic = false },
          variables = { italic = false },
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "dark", -- style for sidebars, see below
          floats = "dark", -- style for floating windows
        },
        on_highlights = function(highlights, colors)
          highlights["LspInlayHint"] = {
            style = { italic = true },
          }
          highlights["@conditional"] = { fg = colors.magenta, style = { italic = true } }
          highlights["@repeat"] = { fg = colors.magenta, style = { italic = true } }
          --   highlights["@Comment"] = { fg = colors.red}
          -- TabLineFill = { link = "StatusLine" },
          -- LspInlayHint = { style = { "italic" } },
          highlights["@parameter"] = { fg = colors.cyan, style = { italic = true } }
          -- highlights["@type.builtin"] = { style = {"italic"} },
          -- highlights["@namespace"] = { style = {"italic"} },
          -- highlights["@text.uri"] = { style = { "underline" } },
          -- highlights["@tag.attribute"] = { style = {"italic"} },
          -- highlights["@tag.attribute.tsx"] = { style = {} },
        end,
      }
    end,
  },
}
