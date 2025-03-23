return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  -- stylua: ignore
  keys = {
    { '<Leader>o', function() require('harpoon'):list():add() end },
    { '<Leader>g', function() local harpoon = require('harpoon') harpoon.ui:toggle_quick_menu(harpoon:list()) end },
    { '<Leader>1', function() require('harpoon'):list():select(1) end },
    { '<Leader>2', function() require('harpoon'):list():select(2) end },
    { '<Leader>3', function() require('harpoon'):list():select(3) end },
    { '<Leader>4', function() require('harpoon'):list():select(4) end },
    { '<Leader>5', function() require('harpoon'):list():select(5) end },
    { '[p', function() require('harpoon'):list():prev() end },
    { ']p', function() require('harpoon'):list():next() end },
  },
  opts = {},

  config = function()
    local harpoon = require('harpoon')

    harpoon:extend({
      UI_CREATE = function(cx)
        vim.keymap.set('n', '<C-v>', function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set('n', '<C-s>', function()
          harpoon.ui:select_menu_item({ split = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set('n', '<C-t>', function()
          harpoon.ui:select_menu_item({ tabedit = true })
        end, { buffer = cx.bufnr })
      end,
    })
  end,
}
