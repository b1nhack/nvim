return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },

  ---@module 'gitsigns'
  ---@type Gitsigns.Config
  opts = {
    signs = {
      add = { text = ' ' },
      change = { text = ' ' },
      delete = { text = ' ' },
      topdelete = { text = ' ' },
      changedelete = { text = ' ' },
      untracked = { text = '┆' },
    },
    signs_staged = {
      add = { text = '┃' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '_' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    },
    attach_to_untracked = true,
    sign_priority = 9,

    preview_config = {
      -- Options passed to nvim_open_win
      border = 'rounded',
    },

    on_attach = function(bufnr)
      local gitsigns = require('gitsigns')

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']h', function()
        if vim.wo.diff then
          vim.cmd.normal({ ']c', bang = true })
        else
          gitsigns.nav_hunk('next')
        end
      end)

      map('n', '[h', function()
        if vim.wo.diff then
          vim.cmd.normal({ '[c', bang = true })
        else
          gitsigns.nav_hunk('prev')
        end
      end)

      -- Actions
      map('n', '<Leader>hs', gitsigns.stage_hunk)
      map('n', '<Leader>hr', gitsigns.reset_hunk)
      map('v', '<Leader>hs', function()
        gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end)
      map('v', '<Leader>hr', function()
        gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end)
      map('n', '<Leader>hS', gitsigns.stage_buffer)
      map('n', '<Leader>hR', gitsigns.reset_buffer)
      map('n', '<Leader>hp', gitsigns.preview_hunk)
      map('n', '<Leader>hb', function()
        gitsigns.blame_line({ full = true })
      end)
      map('n', '<Leader>hd', gitsigns.diffthis)
      map('n', '<Leader>hD', function()
        gitsigns.diffthis('~')
      end)

      -- Text object
      map({ 'o', 'x' }, 'kh', ':<C-U>Gitsigns select_hunk<CR>', { silent = true })
    end,
  },
}
