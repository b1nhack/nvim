return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'nvim-navbuddy',
    'mason.nvim',
    'nvim-lspconfig',
  },
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  opts = {},

  config = function()
    local lsp = require('config.lsp')

    require('mason-lspconfig').setup_handlers({
      function(server_name)
        require('lspconfig')[server_name].setup({
          capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })
      end,

      ['lua_ls'] = function()
        lsp.lua_ls()
      end,
    })
  end,
}
