return {
  'hiphish/rainbow-delimiters.nvim',
  dependencies = {
    'nvim-treesitter',
  },
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
}
