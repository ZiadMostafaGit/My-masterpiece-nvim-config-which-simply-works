-- Enable LSP support
local lspconfig = require('lspconfig')
local cmp = require('cmp')
local luasnip = require('luasnip')

-- Autocompletion setup
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
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
lspconfig.pyright.setup({ capabilities = capabilities }) -- Python
lspconfig.rust_analyzer.setup({ capabilities = capabilities }) -- Rust
lspconfig.gopls.setup({ capabilities = capabilities }) -- Go
lspconfig.clangd.setup({ capabilities = capabilities }) -- C++


vim.api.nvim_set_keymap('i', 'j', 'pumvisible() ? "<C-n>" : "j"', { expr = true, noremap = true })
vim.api.nvim_set_keymap('i', 'k', 'pumvisible() ? "<C-p>" : "k"', { expr = true, noremap = true })


