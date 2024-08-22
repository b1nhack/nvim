return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = 'markdown',
  opts = {
    latex = {
      enabled = false,
    },
  },
  dependencies = { 'nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
}
