return {
  'dhananjaylatkar/cscope_maps.nvim',
  event = 'VeryLazy',

  ---@module 'cscope_maps'
  ---@type CsMapsConfig
  opts = {
    cscope = {
      picker = 'telescope',
      skip_picker_for_single_result = true,
    },
  },
}
