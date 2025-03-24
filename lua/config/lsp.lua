local M = {}

local capabilities = require('blink.cmp').get_lsp_capabilities()
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
