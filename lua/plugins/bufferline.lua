return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',

  config = function()
    local bufferline = require('bufferline')

    bufferline.setup {
      options = {
        mode = 'tabs',
        style_preset = bufferline.style_preset.minimal,
        close_command = false,
        right_mouse_command = false,
        left_mouse_command = false,
        middle_mouse_command = false,

        custom_filter = function(buf_number, buf_numbers)
          if vim.bo[buf_number].filetype ~= 'oil' then
            return true
          end
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
      },
      highlights = require('catppuccin.groups.integrations.bufferline').get(),
    }

    vim.keymap.set('n', '<Leader>bs', '<CMD>BufferLinePick<CR>')
  end,
}
