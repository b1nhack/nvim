return {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  ft = 'rust',

  config = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set({ 'n', 'x' }, '<C-CR>', function()
            vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
          end, { buffer = bufnr })
        end,
      },
    }
  end,
}
