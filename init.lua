require("ziad")

vim.opt.relativenumber = true
vim.opt.number = true




vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})

