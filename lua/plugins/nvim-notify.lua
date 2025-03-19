return {
  'rcarriga/nvim-notify',

  ---@module 'notify'
  ---@type notify.Config
  opts = {
    icons = {
      DEBUG = ' ',
      ERROR = ' ',
      INFO = ' ',
      TRACE = ' ',
      WARN = ' ',
    },

    stages = 'fade',
    timeout = 3000,
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { zindex = 99 })
    end,
    merge_duplicates = false,
  },
}
