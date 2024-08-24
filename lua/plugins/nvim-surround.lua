return {
  'kylechui/nvim-surround',
  version = '*', -- Use for stability; omit to use `main` branch for the latest features
  event = 'VeryLazy',
  config = function()
    require('nvim-surround').setup({
      keymaps = {
        insert = false,
        insert_line = false,
        normal = 'ys',
        normal_cur = 'yss',
        normal_line = 'yS',
        normal_cur_line = 'ySS',
        visual = 'gs',
        visual_line = 'gS',
        delete = 'yd',
        change = 'yc',
        change_line = false,
      },
    })
  end,
}
