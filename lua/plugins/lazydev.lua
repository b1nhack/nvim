return {
  {
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on lua files
    cmd = 'LazyDev',

    config = function()
      require('lazydev').setup({
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = 'luvit-meta/library', words = { 'vim%.uv' } },
        },
      })
    end,
  },
  'Bilal2453/luvit-meta', -- optional `vim.uv` typings
}
