return {
  'neovim/nvim-lspconfig',

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
          [vim.diagnostic.severity.HINT] = '󰌶 ',
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
  end,

  config = function()
    vim.keymap.set('n', '<Leader>e', function()
      vim.diagnostic.open_float({ border = 'rounded' })
    end)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local bufnr = ev.buf
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        local opts = { buffer = bufnr }
        vim.keymap.set('n', '<Leader>e', function()
          if client ~= nil and client.name == 'rust-analyzer' then
            vim.cmd.RustLsp('renderDiagnostic')
          else
            vim.diagnostic.open_float({ border = 'rounded' })
          end
        end, opts)
        vim.keymap.set({ 'n', 'x' }, '<C-CR>', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<C-j>', vim.lsp.buf.signature_help, opts)

        if client ~= nil and client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable()
        end
      end,
    })
  end,
}
