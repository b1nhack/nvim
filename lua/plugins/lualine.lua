return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',

  config = function()
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

    require('lualine').setup({
      options = {
        theme = 'catppuccin',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
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

      tabline = {
        lualine_a = {
          {
            function()
              return [[ ]]
            end,
            separator = { left = '', right = '' },
          },
        },
        lualine_b = {
          {
            'tabs',
            max_length = vim.o.columns, -- Maximum width of tabs component.
            -- Note:
            -- It can also be a function that returns
            -- the value of `max_length` dynamically.
            mode = 1, -- 0: Shows tab_nr
            -- 1: Shows tab_name
            -- 2: Shows tab_nr + tab_name

            path = 1, -- 0: just shows the filename
            -- 1: shows the relative path and shorten $HOME to ~
            -- 2: shows the full path
            -- 3: shows the full path and shorten $HOME to ~

            -- Automatically updates active tab color to match color of other components (will be overidden if buffers_color is set)
            use_mode_colors = true,

            show_modified_status = false, -- Shows a symbol next to the tab name if the file has been modified.
          },
        },
      },

      extensions = {
        'lazy',
        'man',
        'mason',
        'nvim-dap-ui',
        'oil',
        'quickfix',
      },
    })

    vim.o.showtabline = 1
  end,
}
