return {
  'Wansmer/treesj',
  dependencies = {
    'nvim-treesitter',
  },
  -- stylua: ignore
  keys = {
    { 'J', function() require('treesj').toggle() end },
  },

  opts = {
    use_default_keymaps = false,
  },
}
