local M = {}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

M.lua_ls = function()
  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern(
      '.luarc.json',
      '.luarc.jsonc',
      '.luacheckrc',
      '.stylua.toml',
      'stylua.toml',
      'selene.toml',
      'selene.yml',
      '.git',
      'lazy-lock.json'
    ),
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
      },
    },
  })
end

return M
