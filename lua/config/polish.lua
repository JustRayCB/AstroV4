-- This file is automatically ran last in the setup process and is a good place to configure
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here

-- vim.api.nvim_create_autocmd("User", {
--   desc = "Hightlight colorcolumn",
--   pattern = "*",
--   command = "highlight ColorColumn guibg=Red",
-- })
--
-- vim.api.nvim_create_autocmd("User", {
--   desc = "no auto comment after pressing o",
--   pattern = "*",
--   command = "setlocal formatoptions-=o",
-- })
--
-- vim.api.nvim_create_autocmd({ "BufLeave *.tex", "VimLeave *.tex" }, {
--   desc = "Move .pdf to main folder",
--   pattern = "*.tex",
--   command = "silent !mv build/*.pdf .",
-- })
-- --
-- vim.api.nvim_create_autocmd({ "BufEnter *.uml", "VimEnter *.uml" }, {
--   desc = "Set filetype to plantuml",
--   pattern = "*.uml",
--   command = "set ft=plantuml",
-- })
-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     uml = "plantuml",
--     puml = "plantuml",
--     foo = "fooscript",
--   },
-- }
vim.filetype.add {
  extension = {
    foo = "fooscript",
    sql = "mysql",
    plantuml = "uml",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}
