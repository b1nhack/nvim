return {
  'folke/trouble.nvim',
  cmd = 'Trouble',
  keys = {
    '<Leader>fs',
    '<Leader>fd',
    '<Leader>fD',

    '<Leader>fx',
    '<Leader>fX',

    '<Leader>ft',

    'gr',
    'gd',
    'gy',
    'gi',
    'gD',
    'gu',
    'ge',
  },

  config = function()
    local icons = require('config.global').icons

    require('trouble').setup({
      focus = true,

      icons = {
        ---@type trouble.Indent.symbols
        indent = {
          fold_open = ' ',
          fold_closed = ' ',
        },
        folder_closed = ' ',
        folder_open = ' ',
        kinds = {
          Array = icons.Array,
          Boolean = icons.Boolean,
          Class = icons.Class,
          Constant = icons.Constant,
          Constructor = icons.Constructor,
          Enum = icons.Enum,
          EnumMember = icons.EnumMember,
          Event = icons.Event,
          Field = icons.Field,
          File = icons.File,
          Function = icons.Function,
          Interface = icons.Interface,
          Key = icons.Key,
          Method = icons.Method,
          Module = icons.Module,
          Namespace = icons.Namespace,
          Null = icons.Null,
          Number = icons.Number,
          Object = icons.Object,
          Operator = icons.Operator,
          Package = icons.Package,
          Property = icons.Property,
          String = icons.String,
          Struct = icons.Struct,
          TypeParameter = icons.TypeParameter,
          Variable = icons.Variable,
        },
      },
    })

    vim.keymap.set('n', '<Leader>fs', '<CMD>Trouble symbols toggle<CR>')
    vim.keymap.set('n', '<Leader>fd', '<CMD>Trouble diagnostics toggle filter.buf=0<CR>')
    vim.keymap.set('n', '<Leader>fD', '<CMD>Trouble diagnostics toggle<CR>')

    vim.keymap.set('n', '<Leader>fx', '<CMD>Trouble loclist toggle<CR>')
    vim.keymap.set('n', '<Leader>fX', '<CMD>Trouble quickfix toggle<CR>')

    vim.keymap.set('n', '<Leader>ft', '<CMD>Trouble todo<CR>')

    vim.keymap.set('n', 'gr', '<CMD>Trouble lsp_references toggle auto_jump=true<CR>')
    vim.keymap.set('n', 'gd', '<CMD>Trouble lsp_definitions toggle auto_jump=true<CR>')
    vim.keymap.set('n', 'gy', '<CMD>Trouble lsp_type_definitions toggle auto_jump=true<CR>')
    vim.keymap.set('n', 'gi', '<CMD>Trouble lsp_implementations toggle auto_jump=true<CR>')
    vim.keymap.set('n', 'gD', '<CMD>Trouble lsp_declarations toggle auto_jump=true<CR>')
    vim.keymap.set('n', 'gu', '<CMD>Trouble lsp_outgoing_calls toggle<CR>')
    vim.keymap.set('n', 'ge', '<CMD>Trouble lsp_incoming_calls toggle<CR>')
  end,
}
