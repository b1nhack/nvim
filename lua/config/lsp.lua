local M = {}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

M.nixd = function()
  lspconfig.nixd.setup({
    capabilities = capabilities,
    settings = {
      nixd = {
        formatting = {
          command = { 'nixfmt' },
        },
      },
    },
  })
end

return M
