require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt", "vim" },
    enable_check_bracket_line = false -- Don't add pairs if it already has a close pair in the same line
})

