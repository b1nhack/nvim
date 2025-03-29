local func = require('config.picker')
local opts = {
  layout = {
    layout = {
      box = 'horizontal',
      backdrop = false,
      row = -1,
      height = 0.4,
      border = 'top',
      title = ' {title} {live} {flags}',
      title_pos = 'left',
      { win = 'list', border = 'none' },
      { win = 'preview', title = '{preview}', width = 0.6, border = 'left' },
    },
  },
}

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  -- stylua: ignore
  keys = {
    { '<Leader>bd', function() Snacks.bufdelete() end, desc = 'Delete Buffer' },
    -- picker
    { '<Leader>ff', func.project_files, desc = 'Find Files' },
    { '<Leader>fg', func.live_grep_from_project_git_root, desc = 'Grep' },
    { '<Leader>fb', function() Snacks.picker.buffers() end, desc = 'Buffers' },
    { '<Leader>fh', function() Snacks.picker.help() end, desc = 'Help Pages' },
    { 'gr', function() Snacks.picker('lsp_references', opts) end, desc = 'References' },
    { 'gd', function() Snacks.picker('lsp_definitions', opts) end, desc = 'Goto Definition' },
    { 'gD', function() Snacks.picker('lsp_declarations', opts) end, desc = 'Goto Declaration' },
    { 'gy', function() Snacks.picker('lsp_type_definitions', opts) end, desc = 'Goto T[y]pe Definition' },
    { 'gi', function() Snacks.picker('lsp_implementations', opts) end, desc = 'Goto Implementation' },
    { '<Leader>fl', function() Snacks.picker.resume() end, desc = 'Resume' },
  },

  ---@module 'snacks'
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = {
      enabled = true,
      layout = { cycle = false },
      prompt = ' ',
      formatters = { selected = { show_always = true, unselected = false } },
      actions = {
        trouble_open = function(...)
          require('trouble.sources.snacks').actions.trouble_open(...)
        end,
      },
      win = {
        -- input window
        input = {
          keys = {
            -- to close the picker on ESC instead of going to normal mode,
            -- add the following keymap to your config
            -- ["<Esc>"] = { "close", mode = { "n", "i" } },
            ['/'] = false,
            ['<C-Down>'] = false,
            ['<C-b>'] = { 'history_forward', mode = { 'i', 'n' } },
            ['<C-Up>'] = false,
            ['<C-h>'] = { 'history_back', mode = { 'i', 'n' } },
            ['<C-c>'] = { 'cancel', mode = 'i' },
            ['<C-w>'] = false,
            ['<CR>'] = { 'confirm', mode = { 'n', 'i' } },
            ['<Down>'] = { 'list_down', mode = { 'i', 'n' } },
            ['<Esc>'] = 'cancel',
            ['<S-CR>'] = false,
            ['<S-Tab>'] = { 'select_and_prev', mode = { 'i', 'n' } },
            ['<Tab>'] = { 'select_and_next', mode = { 'i', 'n' } },
            ['<Up>'] = { 'list_up', mode = { 'i', 'n' } },
            ['<a-d>'] = false,
            ['<a-f>'] = false,
            ['<a-h>'] = false,
            ['<a-i>'] = false,
            ['<a-m>'] = false,
            ['<c-p>'] = { 'toggle_preview', mode = { 'i', 'n' } },
            ['<a-w>'] = false,
            ['<c-a>'] = { 'select_all', mode = { 'n', 'i' } },
            ['<c-b>'] = false,
            ['<c-s-u>'] = { 'preview_scroll_up', mode = { 'i', 'n' } },
            ['<c-d>'] = false,
            ['E'] = 'list_scroll_down',
            ['<c-f>'] = false,
            ['<c-s-e>'] = { 'preview_scroll_down', mode = { 'i', 'n' } },
            ['<c-g>'] = false,
            ['<c-j>'] = false,
            ['<c-k>'] = false,
            ['<c-n>'] = false,
            ['<c-q>'] = 'trouble_open',
            ['<c-s>'] = { 'edit_split', mode = { 'i', 'n' } },
            ['<c-t>'] = { 'tab', mode = { 'n', 'i' } },
            ['<c-u>'] = false,
            ['U'] = 'list_scroll_up',
            ['<c-v>'] = { 'edit_vsplit', mode = { 'i', 'n' } },
            ['<c-r>#'] = false,
            ['<c-r>%'] = false,
            ['<c-r><c-a>'] = false,
            ['<c-r><c-f>'] = false,
            ['<c-r><c-l>'] = false,
            ['<c-r><c-p>'] = false,
            ['<c-r><c-w>'] = false,
            ['<c-w>H'] = false,
            ['<c-w>J'] = false,
            ['<c-w>K'] = false,
            ['<c-w>L'] = false,
            ['?'] = 'toggle_help_input',
            ['G'] = 'list_bottom',
            ['gg'] = 'list_top',
            ['j'] = false,
            ['e'] = 'list_down',
            ['k'] = false,
            ['u'] = 'list_up',
            ['q'] = 'close',
          },
        },
        -- result list window
        list = {
          keys = {
            ['/'] = false,
            ['<2-LeftMouse>'] = false,
            ['<CR>'] = 'confirm',
            ['<Down>'] = 'list_down',
            ['<Esc>'] = 'cancel',
            ['<S-CR>'] = false,
            ['<S-Tab>'] = { 'select_and_prev', mode = { 'n', 'x' } },
            ['<Tab>'] = { 'select_and_next', mode = { 'n', 'x' } },
            ['<Up>'] = 'list_up',
            ['<a-d>'] = false,
            ['<a-f>'] = false,
            ['<a-h>'] = false,
            ['<a-i>'] = false,
            ['<a-m>'] = false,
            ['<c-p>'] = 'toggle_preview',
            ['<a-w>'] = false,
            ['<c-a>'] = 'select_all',
            ['<c-b>'] = false,
            ['<c-s-u>'] = 'preview_scroll_up',
            ['<c-d>'] = false,
            ['E'] = 'list_scroll_down',
            ['<c-f>'] = false,
            ['<c-s-e>'] = 'preview_scroll_down',
            ['<c-j>'] = false,
            ['<c-k>'] = false,
            ['<c-n>'] = false,
            ['<c-q>'] = 'trouble_open',
            ['<c-s>'] = 'edit_split',
            ['<c-t>'] = 'tab',
            ['<c-u>'] = false,
            ['U'] = 'list_scroll_up',
            ['<c-v>'] = 'edit_vsplit',
            ['<c-w>H'] = false,
            ['<c-w>J'] = false,
            ['<c-w>K'] = false,
            ['<c-w>L'] = false,
            ['?'] = 'toggle_help_list',
            ['G'] = 'list_bottom',
            ['gg'] = 'list_top',
            ['i'] = false,
            ['k'] = 'focus_input',
            ['j'] = false,
            ['e'] = 'list_down',
            ['u'] = 'list_up',
            ['q'] = 'close',
            ['zb'] = false,
            ['zt'] = false,
            ['zz'] = false,
          },
        },
        -- preview window
        preview = {
          keys = {
            ['<Esc>'] = 'cancel',
            ['q'] = 'close',
            ['i'] = false,
            ['k'] = 'focus_input',
            ['<a-w>'] = false,
          },
        },
      },
      ---@class snacks.picker.icons
      icons = {
        ui = {
          selected = ' ',
        },
        git = {
          enabled = true, -- show git icons
          staged = '┃', -- staged changes. always overrides the type icons
          added = ' ',
          deleted = ' ',
          modified = ' ',
          untracked = '┆',
        },
        diagnostics = {
          Error = ' ',
          Warn = ' ',
          Hint = ' ',
          Info = ' ',
        },
      },
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    -- enable when https://github.com/folke/snacks.nvim/issues/1621 close
    -- scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
