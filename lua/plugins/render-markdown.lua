return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ft = 'markdown',

  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    completions = { lsp = { enabled = true } },
    latex = {
      enabled = false,
    },
  },
}
