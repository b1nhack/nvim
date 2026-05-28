return {
  'echasnovski/mini.bufremove',
  version = false,
  keys = {
    {
      '<Leader>bd',
      function()
        require('mini.bufremove').delete()
      end,
    },
  },
  opts = {},
}
