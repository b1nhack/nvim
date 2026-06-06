return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,

  ---@module 'tokyonight'
  ---@type tokyonight.Config
  opts = {
    dim_inactive = true,
  },

  init = function()
    vim.cmd [[colorscheme tokyonight]]
  end,
}
