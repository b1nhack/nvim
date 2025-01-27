return {
  'stevearc/oil.nvim',
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if you prefer nvim-web-devicons
  event = 'VeryLazy',

  config = function()
    local oil = require('oil')

    oil.setup({
      columns = {
        -- "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
      },

      ---@diagnostic disable-next-line: assign-type-mismatch
      cleanup_delay_ms = false,

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
            local prefills = { paths = oil.get_current_dir() }

            local grug_far = require('grug-far')
            -- instance check
            if not grug_far.has_instance('explorer') then
              grug_far.open {
                instanceName = 'explorer',
                prefills = prefills,
                staticTitle = 'Find and Replace from Explorer',
              }
            else
              grug_far.open_instance('explorer')
              -- updating the prefills without clearing the search and other fields
              grug_far.update_instance_prefills('explorer', prefills, false)
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
    })

    vim.keymap.set('n', '<Leader>a', '<CMD>Oil<CR>')
  end,
}
