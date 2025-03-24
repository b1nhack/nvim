local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',

  opts = {
    options = {
      theme = 'catppuccin',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      always_show_tabline = false,
      globalstatus = true,
      refresh = {
        statusline = 200, -- Note these are in mili second and default is 1000
        tabline = 200,
      },
      disabled_filetypes = {
        statusline = {
          'checkhealth',
        },
      },
    },

    sections = {
      lualine_a = {
        {
          function()
            return [[ ]]
          end,

          separator = { left = '', right = '' },
          padding = { left = 1, right = 0 },
        },

        'mode',
      },
      lualine_b = {
        {
          'b:gitsigns_head',
          icon = '',
        },
        {
          'diff',
          symbols = { added = ' ', modified = ' ', removed = ' ' },
          source = diff_source,
        },
        {
          'diagnostics',

          -- Table of diagnostic sources, available sources are:
          --   "nvim_lsp", "nvim_diagnostic", "nvim_workspace_diagnostic", "coc", "ale", "vim_lsp".
          -- or a function that returns a table as such:
          --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
          sources = { 'nvim_lsp' },

          symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰌶 ' },
        },
      },

      lualine_x = {
        {
          require('lazy.status').updates,
          cond = require('lazy.status').has_updates,
          color = { fg = '#ff9e64' },
        },
        'encoding',
        {
          'fileformat',
          symbols = {
            unix = 'LF',
            dos = 'CRLF',
            mac = 'CR',
          },
        },
        'filetype',
      },

      lualine_z = {
        {
          'location',
          separator = { left = '', right = '' },
          padding = { left = 1, right = 0 },
        },
        {
          'datetime',
          -- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
          style = ' %H:%M',
          separator = { left = '', right = '' },
        },
      },
    },

    extensions = {
      'lazy',
      'man',
      'mason',
      'oil',
      'quickfix',
    },
  },
}
