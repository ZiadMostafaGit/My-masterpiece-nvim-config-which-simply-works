local builtin = require('telescope.builtin')

-- Search files in the current directory
vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files({ cwd = vim.fn.getcwd() })
end, {})

-- Search files in Git directories
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- Search files from the root directory (~), including hidden files
vim.keymap.set('n', '<leader>ps', function()
    builtin.find_files({ cwd = "~", hidden = true })
end, {})

