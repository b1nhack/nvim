return {
  'dhananjaylatkar/cscope_maps.nvim',
  cmd = {
    'Cscope',
    'Cs',
    'Cstag',
    'CsPrompt',
    'CsStackView',
  },

  ---@module 'cscope_maps'
  ---@type CsMapsConfig
  opts = {
    cscope = {
      skip_picker_for_single_result = true,
    },
  },
}
