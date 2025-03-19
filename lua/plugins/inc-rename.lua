return {
  'smjonas/inc-rename.nvim',
  keys = {
    { '<Leader>rn', ':IncRename ' },
  },

  ---@module 'inc_rename'
  ---@type inc_rename.UserConfig
  opts = {
    save_in_cmdline_history = false,
  },
}
