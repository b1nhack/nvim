local M = {}

local capabilities = require('blink.cmp').get_lsp_capabilities()
local lspconfig = require('lspconfig')

function M.nixd()
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
