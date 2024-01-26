-- This file is automatically ran last in the setup process and is a good place to configure
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here

-- This has to be before other autocommands because if not it will not work
vim.filetype.add {
  extension = {
    foo = "fooscript",
    uml = "plantuml",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}

vim.api.nvim_create_autocmd("User", {
  desc = "Hightlight colorcolumn",
  pattern = "*",
  command = "highlight ColorColumn guibg=Red",
})
--
vim.api.nvim_create_autocmd("User", {
  desc = "no auto comment after pressing o",
  pattern = "*",
  command = "setlocal formatoptions-=o",
})
--
vim.api.nvim_create_autocmd({ "BufLeave *.tex", "VimLeave *.tex" }, {
  desc = "Move .pdf to main folder",
  pattern = "*.tex",
  command = "silent !mv build/*.pdf .",
})

vim.api.nvim_create_augroup("Templates", {})
vim.api.nvim_create_autocmd("BufNewFile *.cpp", {
  desc = "Set template for cpp files",
  pattern = "*.cpp",
  group = "Templates",
  command = "0r /home/cbr/.vim/templates/skeleton.cpp",
})
