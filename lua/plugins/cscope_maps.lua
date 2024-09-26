return {
  'dhananjaylatkar/cscope_maps.nvim',
  event = 'VeryLazy',
  opts = {
    cscope = {
      picker = 'telescope',
      skip_picker_for_single_result = true,
    },
  },
}
