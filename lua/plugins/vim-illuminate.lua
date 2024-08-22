return {
  'RRethy/vim-illuminate',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },

  config = function()
    require('illuminate').configure({
      delay = 200,
      modes_allowlist = {
        'n',
        'x',
      },
      filetypes_denylist = {
        'TelescopePrompt',
        'TelescopeResults',
        'checkhealth',
        'dap-repl',
        'dapui_breakpoints',
        'dapui_console',
        'dapui_scopes',
        'dapui_stacks',
        'dapui_watches',
        'gitcommit',
        'help',
        'lazy',
        'lspinfo',
        'man',
        'mason',
        'neotest-summary',
        'neotest-output-panel',
        'noice',
        'oil',
        'spectre_panel',
        'trouble',
      },
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { 'lsp' },
      },
    })
  end,
}
