return {
  'RRethy/vim-illuminate',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },

  config = function()
    require('illuminate').configure({
      delay = 200,
      modes_allowlist = {
        'n',
        'x',
      },
      filetypes_denylist = require('config.global').exclude_types,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { 'lsp' },
      },
    })
  end,
}
