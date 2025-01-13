-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Install TokyoNight theme
  use {
    'folke/tokyonight.nvim',
    config = function()
      -- Set the TokyoNight style
      vim.g.tokyonight_style = 'night' -- or 'storm', 'day', 'moon'
      vim.g.tokyonight_transparent = true -- Optional: Make background transparent
      vim.cmd[[colorscheme tokyonight]]
    end
  }



  --
  -- -- Other themes (Rose Pine)
  -- use({
  --   'rose-pine/neovim',
  --   as = 'rose-pine',
  --   config = function()
  --     vim.cmd('colorscheme rose-pine')
  --   end
  -- })
-- Add this to your plugins.lua or init.lua




-- use {
--   "zbirenbaum/copilot.lua",
--   event = "VimEnter",
--   config = function()  -- Wrap the setup in a function
--     require("copilot").setup({
--       suggestion = {
--         enabled = true,
--         auto_trigger = true,  -- Show suggestions as you type
--         keymap = {
--           accept = "<M-CR>",  -- Map Alt+Enter to accept suggestion
--           next = "<M-]>",     -- Map Alt+] to next suggestion
--           prev = "<M-[>",     -- Map Alt+[ to previous suggestion
--           dismiss = "<C-]>",  -- Map Ctrl+] to dismiss suggestion
--         },
--       },
--       panel = {
--         enabled = false,  -- Disable the Copilot panel (optional)
--       },
--     })
--   end,  -- End of the config function
-- }
--
--
--
--
-- use {
--   "zbirenbaum/copilot-cmp",
--   after = { "copilot.lua" },
--   config = function ()
--     require("copilot_cmp").setup()
--   end
-- }
--
--
--
--
use {





  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end
}
  -- Autopairs and other tools
  use 'windwp/nvim-autopairs'
  use 'sbdchd/neoformat'

  -- LSP support
  use 'neovim/nvim-lspconfig' -- LSP configurations
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  -- Optional for a better completion experience
  use 'hrsh7th/cmp-buffer' -- Buffer completions
  use 'hrsh7th/cmp-path' -- Path completions
  use 'L3MON4D3/LuaSnip' -- Snippet engine
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  -- Language-specific tools (optional but recommended)
  use 'simrat39/rust-tools.nvim' -- Rust support
  use ('mbbill/undotree')
  use ('ThePrimeagen/harpoon')
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSupdate'})
  use ('nvim-treesitter/playground')
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require("toggleterm").setup {
        open_mapping = [[<C-/>]],
        direction = "horizontal", -- Can be "vertical", "float", or "tab"
        size = 15
      }
    end
  }

end)

