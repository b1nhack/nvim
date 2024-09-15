return {
  'dhananjaylatkar/cscope_maps.nvim',
  event = 'VeryLazy',
  opts = {
    skip_input_prompt = true,
    cscope = {
      picker = 'telescope',
      skip_picker_for_single_result = true,
    },
  },
}
