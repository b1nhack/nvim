return {
  'RRethy/vim-illuminate',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },

  config = function()
    require('illuminate').configure({
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
      disable_keymaps = true,
    })
  end,
}
