-- Function to apply a theme and customize highlighting
function ColorMyPencils(color)
    color = color or "tokyonight"  -- Default to TokyoNight if no color is specified

    -- Apply the colorscheme
    vim.cmd.colorscheme(color)

    -- Set transparent background for both Normal and NormalFloat highlights
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    -- Additional customizations for specific themes can be added here
    if color == "tokyonight" then
        -- Example: Customize TokyoNight specific highlights or settings
        vim.g.tokyonight_style = 'night' -- or 'storm', 'day', 'moon'
        vim.g.tokyonight_transparent = true -- Optional: Make background transparent
    end
end

-- Call the function to apply the theme
ColorMyPencils()

