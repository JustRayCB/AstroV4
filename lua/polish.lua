-- This file is automatically ran last in the setup process and is a good place to configure
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here

-- This has to be before other autocommands because if not it will not work
vim.filetype.add {
  extension = {
    foo = "fooscript",
    uml = "plantuml",
    rasi = "rasi",
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

vim.api.nvim_create_autocmd("User", {
  desc = "no auto comment after pressing o",
  pattern = "*",
  command = "setlocal formatoptions-=o",
})

vim.cmd "cnoremap <c-k> <c-p>"
vim.cmd "cnoremap <c-j> <c-n>"

vim.api.nvim_create_autocmd("VimEnter", {
  nested = true,
  pattern = "*",
  desc = "Root detection when entering a buffer",
  callback = function(args)
    local bufnr = args.buf
    vim.bo[bufnr].buflisted = true -- Make sure the buffer is listed
    require("astrocore.rooter").root(bufnr)
  end,
  -- command = "lua require('astrocore.rooter').root(vim.fn.bufnr())",
})
