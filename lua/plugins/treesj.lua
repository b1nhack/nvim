return {
  'Wansmer/treesj',
  -- stylua: ignore
  keys = {
    { 'J', function() require('treesj').toggle() end },
  },

  opts = {
    use_default_keymaps = false,
    max_join_length = 1000,
  },
}
