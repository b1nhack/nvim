return {
  'numToStr/Comment.nvim',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  opts = {
    extra = {
      ---Add comment at the end of line
      eol = 'gcI',
    },
  },
}
