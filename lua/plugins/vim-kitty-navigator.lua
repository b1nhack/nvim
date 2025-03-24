return {
  'knubie/vim-kitty-navigator',
  build = 'cp ./*.py ~/.config/kitty/',
  keys = {
    { '<M-u>', '<CMD>KittyNavigateUp<CR>', mode = { 'n', 'x' } },
    { '<M-e>', '<CMD>KittyNavigateDown<CR>', mode = { 'n', 'x' } },
    { '<M-n>', '<CMD>KittyNavigateLeft<CR>', mode = { 'n', 'x' } },
    { '<M-i>', '<CMD>KittyNavigateRight<CR>', mode = { 'n', 'x' } },
  },

  init = function()
    vim.g.kitty_navigator_no_mappings = 1
  end,
}
