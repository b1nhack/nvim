return {
  'dhananjaylatkar/cscope_maps.nvim',
  cmd = {
    'Cscope',
    'Cs',
    'Cstag',
    'CsPrompt',
    'CsStackView',
  },
  keys = {
    '<Leader>ca',
    '<Leader>cc',
    '<Leader>cd',
    '<Leader>ce',
    '<Leader>cf',
    '<Leader>cg',
    '<Leader>ci',
    '<Leader>cs',
    '<Leader>ct',
  },

  ---@module 'cscope_maps'
  ---@type CsMapsConfig
  opts = {
    cscope = {
      skip_picker_for_single_result = true,
    },
  },
}
