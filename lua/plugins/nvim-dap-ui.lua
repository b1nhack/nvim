return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'nvim-neotest/nvim-nio',
  },

  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('dapui').setup({
      mappings = {
        edit = 'k',
        expand = '<CR>',
        open = 'o',
        remove = 'd',
        repl = 'r',
        toggle = 't',
      },
    })
  end,
}
