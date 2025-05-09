return {
  'stevearc/oil.nvim',
  event = 'VeryLazy',
  keys = {
    { '<Leader>a', '<CMD>Oil<CR>' },
  },

  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    columns = {
      -- "icon",
      -- "permissions",
      -- "size",
      -- "mtime",
    },

    cleanup_delay_ms = 0,

    win_options = {
      signcolumn = 'yes',
    },

    keymaps = {
      ['?'] = 'actions.show_help',
      ['<CR>'] = 'actions.select',
      ['<C-v>'] = {
        'actions.select',
        opts = { vertical = true },
        desc = 'Open the entry in a vertical split',
      },
      ['<C-s>'] = {
        'actions.select',
        opts = { horizontal = true },
        desc = 'Open the entry in a horizontal split',
      },
      ['<C-t>'] = { 'actions.select', opts = { tab = true }, desc = 'Open the entry in new tab' },
      ['<C-p>'] = 'actions.preview',
      ['<C-c>'] = 'actions.close',
      ['r'] = 'actions.refresh',
      ['-'] = 'actions.parent',
      ['_'] = 'actions.open_cwd',
      ['`'] = false,
      ['~'] = false,
      -- create a new mapping, gs, to search and replace in the current directory
      gs = {
        callback = function()
          -- get the current directory
          local prefills = { paths = require('oil').get_current_dir() }

          local grug_far = require('grug-far')
          -- instance check
          if not grug_far.has_instance('explorer') then
            grug_far.open {
              instanceName = 'explorer',
              prefills = prefills,
              staticTitle = 'Find and Replace from Explorer',
            }
          else
            grug_far.get_instance('explorer'):open()
            -- updating the prefills without clearing the search and other fields
            grug_far.get_instance('explorer'):update_input_values(prefills, false)
          end
        end,
        desc = 'oil: Search in directory',
      },
      ['gx'] = false,
      ['g.'] = 'actions.toggle_hidden',
      ['g\\'] = false,
    },
    -- Set to false to disable all of the above keymaps
    use_default_keymaps = false,
  },
}
