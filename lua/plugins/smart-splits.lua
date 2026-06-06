return {
  'mrjones2014/smart-splits.nvim',
  -- stylua: ignore
  keys = {
    { '<A-u>', function() require('smart-splits').move_cursor_up() end },
    { '<A-e>', function() require('smart-splits').move_cursor_down() end },
    { '<A-n>', function() require('smart-splits').move_cursor_left() end },
    { '<A-i>', function() require('smart-splits').move_cursor_right() end },

    { '<S-Up>', function() require('smart-splits').resize_up() end },
    { '<S-Down>', function() require('smart-splits').resize_down() end },
    { '<S-Left>', function() require('smart-splits').resize_left() end },
    { '<S-Right>', function() require('smart-splits').resize_right() end },

    { '<A-S-u>', function() require('smart-splits').swap_buf_up() end },
    { '<A-S-e>', function() require('smart-splits').swap_buf_down() end },
    { '<A-S-n>', function() require('smart-splits').swap_buf_left() end },
    { '<A-S-i>', function() require('smart-splits').swap_buf_right() end },
  },
  opts = {
    at_edge = 'stop',
  },
}
