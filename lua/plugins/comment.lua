return {
  'numToStr/Comment.nvim',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },

  ---@module 'Comment'
  ---@type CommentConfig
  opts = {
    extra = {
      ---Add comment at the end of line
      eol = 'gcI',
    },
  },
}
