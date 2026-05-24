return {
  'rcarriga/nvim-notify',

  ---@module 'notify'
  ---@type notify.Config
  opts = {
    fps = 60,
    icons = {
      DEBUG = ' ',
      ERROR = ' ',
      INFO = ' ',
      TRACE = ' ',
      WARN = ' ',
    },

    timeout = 3000,
    stages = 'fade',
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { zindex = 99 })
    end,
  },
}
