return {
  'kylechui/nvim-surround',
  keys = {
    { 'gs', mode = 'x' },
    'yd',
    'yc',
  },

  init = function()
    vim.g.nvim_surround_no_mappings = true
  end,

  config = function()
    vim.keymap.set('x', 'gs', '<Plug>(nvim-surround-visual)', {
      desc = 'Add a surrounding pair around a visual selection',
    })

    vim.keymap.set('n', 'yd', '<Plug>(nvim-surround-delete)', {
      desc = 'Delete a surrounding pair',
    })

    vim.keymap.set('n', 'yc', '<Plug>(nvim-surround-change)', {
      desc = 'Change a surrounding pair',
    })
  end,
}
