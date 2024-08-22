return {
  'SmiteshP/nvim-navic',

  config = function()
    local icons = require('config.global').icons

    require('nvim-navic').setup({
      icons = {
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

      lsp = {
        auto_attach = true,
      },

      highlight = true,
      separator = '  ',
    })
  end,
}
