return {
  'MagicDuck/grug-far.nvim',
  dependencies = 'echasnovski/mini.icons',
  cmd = {
    'GrugFar',
  },
  keys = {
    { '<Leader>s', mode = { 'n', 'x' } },
    { '<Leader>S', mode = { 'n', 'x' } },
  },

  config = function()
    local grug_far = require('grug-far')

    grug_far.setup({
      minSearchChars = 3,
      searchOnInsertLeave = true,
      maxWorkers = 9,
      windowCreationCommand = 'tabnew',
      wrap = false,
      transient = true,
      history = {
        maxHistoryLines = 9999,
      },
      fileIconsProvider = 'mini.icons',
    })

    vim.keymap.set('n', '<Leader>s', function()
      grug_far.open()
    end)

    vim.keymap.set('x', '<Leader>s', function()
      grug_far.open({
        prefills = {
          search = vim.fn.expand('<cword>'),
        },
      })
    end)

    vim.keymap.set('n', '<Leader>S', function()
      grug_far.open({
        prefills = {
          paths = vim.fn.expand('%'),
        },
      })
    end)

    vim.keymap.set('x', '<Leader>S', function()
      grug_far.open({
        prefills = {
          search = vim.fn.expand('<cword>'),
          paths = vim.fn.expand('%'),
        },
      })
    end)
  end,
}
