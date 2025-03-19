return {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false, -- This plugin is already lazy

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
