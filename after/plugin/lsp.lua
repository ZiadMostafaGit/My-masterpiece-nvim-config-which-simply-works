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
  cmd = { 'jdtls' }, -- Ensure the `jdtls` executable is in your PATH
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

-- Keymap adjustments for nvim-cmp
vim.api.nvim_set_keymap('i', 'j', 'pumvisible() ? "<C-n>" : "j"', { expr = true, noremap = true })
vim.api.nvim_set_keymap('i', 'k', 'pumvisible() ? "<C-p>" : "k"', { expr = true, noremap = true })

