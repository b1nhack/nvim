return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  cmd = {
    'LspInfo',
    'LspStart',
    'LspStop',
    'LspRestart',
  },

  init = function()
    vim.diagnostic.config({
      underline = false,
      virtual_text = false,
      severity_sort = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = ' ',
          [vim.diagnostic.severity.WARN] = ' ',
          [vim.diagnostic.severity.INFO] = ' ',
          [vim.diagnostic.severity.HINT] = ' ',
        },
        texthl = {
          [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
          [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
          [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
          [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
          [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
          [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
          [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
        },
      },
    })

    vim.keymap.del('n', 'grn')
    vim.keymap.del('n', 'gra')
    vim.keymap.del('n', 'grr')
    vim.keymap.del('n', 'gri')
    vim.keymap.del('n', 'gO')
    vim.keymap.del('i', '<C-s>')
  end,

  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(ev)
        local bufnr = ev.buf
        local opts = { buffer = bufnr }
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        if client == nil then
          return
        end

        vim.bo[ev.buf].omnifunc = nil
        vim.bo[ev.buf].formatexpr = nil

        vim.keymap.set('n', 'j', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<C-CR>', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)

        vim.keymap.set('n', '<Leader>e', function()
          vim.diagnostic.open_float({ border = 'rounded' })
        end, opts)

        if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
      end,
    })

    vim.api.nvim_create_autocmd('LspDetach', {
      callback = function(ev)
        local bufnr = ev.buf
        local opts = { buffer = bufnr }
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        if client == nil then
          return
        end

        vim.keymap.del('n', 'j', opts)
        vim.keymap.del('n', '<C-CR>', opts)
        vim.keymap.del('n', '<Leader>rn', opts)
        vim.keymap.del('n', '<Leader>e', opts)

        if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
        end
      end,
    })
  end,
}
