return {
  'rcarriga/nvim-notify',

  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('notify').setup({
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
    })
  end,
}
