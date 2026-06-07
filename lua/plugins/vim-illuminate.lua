return {
  'b1nhack/vim-illuminate',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },

  config = function()
    require('illuminate').setup({
      filetypes_denylist = {
        'checkhealth',
        'gitcommit',
        'help',
        'lazy',
        'man',
        'mason',
        'noice',
        'notify',
        'oil',
        'trouble',
      },
      modes_allowlist = {
        'n',
        'x',
      },
      keymaps = {
        next = 'ge',
        prev = 'gu',
      },
    })
  end,
}
