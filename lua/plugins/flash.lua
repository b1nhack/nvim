return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  -- stylua: ignore
  keys = {
    { 's', function() require('flash').jump() end, mode = { 'n', 'x', 'o' }, desc = 'Flash' },
    { 'S', function() require('flash').treesitter() end, mode = { 'n', 'x', 'o' }, desc = 'Flash Treesitter' },
    { 'r', function() require('flash').remote() end, mode = 'o', desc = 'Remote Flash' },
    { 'R', function() require('flash').treesitter_search() end, mode = { 'o', 'x' }, desc = 'Treesitter Search' },
    { '<C-s>', function() require('flash').toggle() end, mode = { 'c' }, desc = 'Toggle Flash Search' },
  },

  ---@module 'flash'
  ---@type Flash.Config
  opts = {
    labels = 'arstneiodhbkmluypfwgjqvcxz',

    search = {
      multi_window = false,
    },

    label = {
      style = 'inline',
      rainbow = {
        enabled = true,
        -- number between 1 and 9
        shade = 3,
      },
    },

    modes = {
      char = {
        jump_labels = true,
        multi_line = false,
        label = { exclude = 'uenikardc' },
      },

      treesitter = {
        labels = 'arstneiodhbkmluypfwgjqvcxz',
      },
    },
  },
}
