return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  event = 'VeryLazy',
  dependencies = { 'mason.nvim' },

  opts = {
    ensure_installed = {
      -- LSP
      'clangd',
      'lua-language-server',
      'python-lsp-server',

      -- Formatter
      'black',
      'clang-format',
      'prettier',
      'shfmt',
      'stylua',
    },

    debounce_hours = 24,
  },
}
