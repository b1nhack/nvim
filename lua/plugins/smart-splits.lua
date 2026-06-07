return {
  'mrjones2014/smart-splits.nvim',
  -- stylua: ignore
  keys = {
    { '<M-u>', function() require('smart-splits').move_cursor_up() end },
    { '<M-e>', function() require('smart-splits').move_cursor_down() end },
    { '<M-n>', function() require('smart-splits').move_cursor_left() end },
    { '<M-i>', function() require('smart-splits').move_cursor_right() end },

    { '<S-Up>', function() require('smart-splits').resize_up() end },
    { '<S-Down>', function() require('smart-splits').resize_down() end },
    { '<S-Left>', function() require('smart-splits').resize_left() end },
    { '<S-Right>', function() require('smart-splits').resize_right() end },

    { '<M-S-u>', function() require('smart-splits').swap_buf_up() end },
    { '<M-S-e>', function() require('smart-splits').swap_buf_down() end },
    { '<M-S-n>', function() require('smart-splits').swap_buf_left() end },
    { '<M-S-i>', function() require('smart-splits').swap_buf_right() end },
  },
  opts = {
    at_edge = 'stop',
  },
}
