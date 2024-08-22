return {
  'mrcjkb/rustaceanvim',
  version = '^4', -- Recommended
  ft = 'rust',

  config = function()
    vim.g.rustaceanvim = {
      ---@type RustaceanToolsOpts
      tools = {
        test_executor = 'neotest',
      },

      ---@type RustaceanLspClientOpts
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
