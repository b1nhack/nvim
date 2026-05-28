return {
  'smjonas/inc-rename.nvim',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },

  ---@module 'inc_rename'
  ---@type inc_rename.UserConfig
  opts = {
    save_in_cmdline_history = false,
  },
}
