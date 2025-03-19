return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },

  ---@module "ibl"
  ---@type ibl.config
  opts = {
    indent = {
      char = '│',
      tab_char = '│',
    },
    scope = { enabled = false },
    exclude = {
      filetypes = require('config.global').exclude_types,
      buftypes = {
        'nofile',
        'prompt',
        'quickfix',
        'terminal',
      },
    },
  },
}
