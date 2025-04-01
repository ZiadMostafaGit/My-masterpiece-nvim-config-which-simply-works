-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- General settings
vim.opt.relativenumber = true
vim.opt.number = true

-- Key mappings for autocomplete
vim.api.nvim_set_keymap('i', 'j', 'pumvisible() ? "<C-n>" : "j"', { expr = true, noremap = true })
vim.api.nvim_set_keymap('i', 'k', 'pumvisible() ? "<C-p>" : "k"', { expr = true, noremap = true })

-- Auto command for format options
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})

-- Set leader key
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Plugin setup using lazy.nvim
require("lazy").setup({
  -- TokyoNight theme
  -- {
  --   "folke/tokyonight.nvim",
  --   config = function()
  --     vim.g.tokyonight_style = "night"
  --     vim.g.tokyonight_transparent = true
  --     vim.cmd("colorscheme tokyonight")
  --   end,
  -- },

 {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
        transparent_background = true,
        integrations = {
          treesitter = true,
          lsp_trouble = true,
          telescope = true,
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          indent_blankline = {
            enabled = true,
            scope_color = "lavender",
          },
        },
      })
      vim.cmd("colorscheme catppuccin-mocha")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
        },
      })
    end,
  },




  -- Comment.nvim
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePrompt", "vim" },
        enable_check_bracket_line = false,
      })
    end,
  },

  -- Neoformat
  {
    "sbdchd/neoformat",
    config = function()
      vim.cmd('autocmd BufWritePre * Neoformat')
    end,
  },

  -- LSP support
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      -- Autocompletion setup
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For luasnip users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        }),
      })

      -- Add LSP capabilities to nvim-cmp
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- LSP servers configuration
      lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
          python = {
            pythonPath = "/home/ziad/WebPython/bin/python3"  -- Path to your virtualenv's Python interpreter
          }
        }
      }) -- Python

      lspconfig.rust_analyzer.setup({ capabilities = capabilities }) -- Rust
      lspconfig.gopls.setup({ capabilities = capabilities }) -- Go
      lspconfig.clangd.setup({ capabilities = capabilities }) -- C++

      -- Java LSP configuration with jdtls (OpenJDK 23.0.1)
      lspconfig.jdtls.setup({
        capabilities = capabilities,
        cmd = { 'jdtls' }, -- Ensure the jdtls executable is in your PATH
        root_dir = lspconfig.util.root_pattern('.git', 'pom.xml', 'build.gradle', '.project'),
        settings = {
          java = {
            configuration = {
              runtimes = {
                {
                  name = "JavaSE-23",
                  path = "/usr/lib/jvm/java-23-openjdk", -- Updated path for OpenJDK 23
                },
              },
            },
          },
        },
      })

      -- TypeScript/JavaScript LSP configuration using ts_ls
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          -- Additional settings or key mappings if needed
        end,
      })

      -- Zig LSP configuration using zls
      lspconfig.zls.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          -- Additional settings or key mappings if needed
        end,
      })

      -- Keymap adjustments for nvim-cmp
      vim.api.nvim_set_keymap('i', 'j', 'pumvisible() ? "<C-n>" : "j"', { expr = true, noremap = true })
      vim.api.nvim_set_keymap('i', 'k', 'pumvisible() ? "<C-p>" : "k"', { expr = true, noremap = true })
    end,
  },
  "hrsh7th/nvim-cmp", -- Autocompletion plugin
  "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
  "hrsh7th/cmp-buffer", -- Buffer completions
  "hrsh7th/cmp-path", -- Path completions
  {
    "L3MON4D3/LuaSnip", -- Snippet engine
    config = function()
      require("luasnip").setup({})
    end,
  },
  "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp

  -- Rust tools
  "simrat39/rust-tools.nvim",

  -- Undotree
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    end,
  },


 -- Lualine (statusline)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
          icons_enabled = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },








  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file)
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

      vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
      vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
      vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
      vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "rust", "javascript", "typescript", "go", "cpp", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "zig" },
        sync_install = false,
        auto_install = true,
        ignore_install = { "javascript" },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        indent = {
          enable = true,
        },
        textobjects = {
          enable = true,
          lsp_interop = {
            enable = true,
            border = 'none',
            floating_preview_opts = {},
          },
        },
      })
    end,
  },
  "nvim-treesitter/playground",

  -- Telescope
 {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")

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

    -- Search for a specific word in files (live grep)
    vim.keymap.set('n', '<leader>pg', function()
        builtin.live_grep({ cwd = vim.fn.getcwd() })
    end, {})
  end,
},
  -- Toggleterm
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<C-/>]],
        direction = "horizontal",
        size = 15,
      })
    end,
  },

  -- GitHub Copilot
  {
    "zbirenbaum/copilot.lua",
    event = "VimEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<M-CR>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        panel = {
          enabled = false,
        },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
})
