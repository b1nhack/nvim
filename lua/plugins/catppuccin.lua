return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  lazy = false,

  init = function()
    vim.cmd.colorscheme('catppuccin')
  end,

  ---@module 'catppuccin'
  ---@type CatppuccinOptions
  opts = {
    flavour = 'macchiato',
    default_integrations = false,
    auto_integrations = true,
  },
}
