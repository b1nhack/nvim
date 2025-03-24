return {
  'MeanderingProgrammer/render-markdown.nvim',
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
