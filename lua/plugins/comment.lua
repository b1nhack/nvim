return {
  'numToStr/Comment.nvim',
  keys = {
    'gcc',
    'gbc',
    { 'gc', mode = { 'n', 'x', 'o' } },
    { 'gb', mode = { 'n', 'x' } },
    'gcO',
    'gco',
    'gcI',
  },

  ---@module 'Comment'
  ---@type CommentConfig
  opts = {
    extra = {
      ---Add comment at the end of line
      eol = 'gcI',
    },
  },
}
