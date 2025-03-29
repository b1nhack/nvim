local function lsp_icon(name)
  local icon, _, _ = require('mini.icons').get('lsp', name)
  return icon
end

return {
  'folke/trouble.nvim',
  cmd = 'Trouble',
  keys = {
    { '<Leader>fs', '<CMD>Trouble symbols toggle focus=true<CR>' },
    { '<Leader>fd', '<CMD>Trouble diagnostics toggle filter.buf=0<CR>' },
    { '<Leader>fD', '<CMD>Trouble diagnostics toggle<CR>' },

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
        Array = lsp_icon('array'),
        Boolean = lsp_icon('boolean'),
        Class = lsp_icon('class'),
        Constant = lsp_icon('constant'),
        Constructor = lsp_icon('constructor'),
        Enum = lsp_icon('enum'),
        EnumMember = lsp_icon('enumMember'),
        Event = lsp_icon('event'),
        Field = lsp_icon('field'),
        File = lsp_icon('file'),
        Function = lsp_icon('function'),
        Interface = lsp_icon('interface'),
        Key = lsp_icon('key'),
        Method = lsp_icon('method'),
        Module = lsp_icon('module'),
        Namespace = lsp_icon('namespace'),
        Null = lsp_icon('null'),
        Number = lsp_icon('number'),
        Object = lsp_icon('object'),
        Operator = lsp_icon('operator'),
        Package = lsp_icon('package'),
        Property = lsp_icon('property'),
        String = lsp_icon('string'),
        Struct = lsp_icon('struct'),
        TypeParameter = lsp_icon('typeParameter'),
        Variable = lsp_icon('variable'),
      },
    },
  },
}
