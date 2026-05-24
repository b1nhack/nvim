return {
  'akinsho/bufferline.nvim',
  version = '*',
  event = 'VeryLazy',
  keys = {
    { '<Leader>bs', '<CMD>BufferLinePick<CR>' },
  },

  config = function()
    ---@module 'bufferline'
    ---@type bufferline.Config
    require('bufferline').setup({
      options = {
        mode = 'tabs',
        style_preset = 2,
        close_command = nil,
        right_mouse_command = nil,
        left_mouse_command = nil,
        middle_mouse_command = nil,

        custom_filter = function(buf_number, _)
          if vim.bo[buf_number].filetype ~= 'oil' then
            return true
          end
          return false
        end,

        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = false,
        show_duplicate_prefix = false,
        duplicates_across_groups = false,
        always_show_bufferline = false,
        hover = {
          enabled = false,
        },
        pick = {
          alphabet = 'arstneiodhbkmluypfwgjqvcxzARSTNEIODHBKMLUYPFWGJQVCXZ1234567890',
        },
      },

      highlights = require('catppuccin.special.bufferline').get_theme(),
    })
  end,
}
