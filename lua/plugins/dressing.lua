return {
  'stevearc/dressing.nvim',
  event = 'VeryLazy',

  opts = {
    input = {
      title_pos = 'center',
      relative = 'win',
    },

    select = {
      backend = { 'nui', 'builtin' },
    },
  },
}
