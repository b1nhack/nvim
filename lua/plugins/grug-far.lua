return {
  'MagicDuck/grug-far.nvim',
  cmd = {
    'GrugFar',
  },
  keys = {
    {
      '<Leader>s',
      function()
        require('grug-far').open()
      end,
      mode = 'n',
    },
    {
      '<Leader>s',
      function()
        require('grug-far').open({
          prefills = {
            search = vim.fn.expand('<cword>'),
          },
        })
      end,
      mode = 'x',
    },
    {
      '<Leader>S',
      function()
        require('grug-far').open({
          prefills = {
            paths = vim.fn.expand('%'),
          },
        })
      end,
      mode = 'n',
    },
    {
      '<Leader>S',
      function()
        require('grug-far').open({
          prefills = {
            search = vim.fn.expand('<cword>'),
            paths = vim.fn.expand('%'),
          },
        })
      end,
      mode = 'x',
    },
  },

  ---@module 'grug-far'
  ---@type grug.far.Options
  opts = {
    minSearchChars = 3,
    normalModeSearch = true,
    maxWorkers = 9,
    windowCreationCommand = 'tabnew',
    wrap = false,
    transient = true,
  },
}
