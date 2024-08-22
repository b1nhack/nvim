return {
  'numToStr/Comment.nvim',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },

  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('Comment').setup({
      ---@diagnostic disable-next-line: missing-fields
      extra = {
        ---Add comment at the end of line
        eol = 'gce',
      },

      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    })
  end,
}
