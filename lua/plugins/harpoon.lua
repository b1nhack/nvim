return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    '<Leader>O',
    '<Leader>o',
    '<Leader>1',
    '<Leader>2',
    '<Leader>3',
    '<Leader>4',
    '<Leader>5',
  },

  config = function()
    local harpoon = require('harpoon')

    harpoon:setup()

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

    vim.keymap.set('n', '<Leader>O', function()
      harpoon:list():add()
    end)
    vim.keymap.set('n', '<Leader>o', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set('n', '<Leader>1', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<Leader>2', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<Leader>3', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<Leader>4', function()
      harpoon:list():select(4)
    end)
    vim.keymap.set('n', '<Leader>5', function()
      harpoon:list():select(5)
    end)
  end,
}
