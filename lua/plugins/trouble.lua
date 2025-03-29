local icons = require('config.global').icons

return {
  'folke/trouble.nvim',
  cmd = 'Trouble',
  keys = {
    { '<Leader>fs', '<CMD>Trouble symbols toggle focus=true<CR>' },
    { '<Leader>fd', '<CMD>Trouble diagnostics toggle filter.buf=0<CR>' },
    { '<Leader>fD', '<CMD>Trouble diagnostics toggle<CR>' },

    { '<Leader>fx', '<CMD>Trouble loclist toggle<CR>' },
    { '<Leader>fX', '<CMD>Trouble quickfix toggle<CR>' },

    { 'gu', '<CMD>Trouble lsp_outgoing_calls toggle<CR>' },
    { 'ge', '<CMD>Trouble lsp_incoming_calls toggle<CR>' },
  },

  ---@module 'trouble'
  ---@type trouble.Config
  opts = {
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
  },
}
