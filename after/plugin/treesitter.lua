require'nvim-treesitter.configs'.setup {
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
}
