return {
  'smjonas/inc-rename.nvim',
  event = 'LspAttach',

  ---@module 'inc_rename'
  ---@type inc_rename.UserConfig
  opts = {
    save_in_cmdline_history = false,
  },
}
