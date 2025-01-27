local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set('n', '<Leader>rr', function()
  vim.cmd.RustLsp('run')
end, { buffer = bufnr })

vim.keymap.set('n', '<Leader>ra', function()
  vim.cmd.RustLsp('runnables')
end, { buffer = bufnr })

vim.keymap.set('n', '<Leader>rm', function()
  vim.cmd.RustLsp('expandMacro')
end, { buffer = bufnr })

vim.keymap.set('n', '<Leader>rb', function()
  vim.cmd.RustLsp('rebuildProcMacros')
end, { buffer = bufnr })

vim.keymap.set('n', '<Leader>re', function()
  vim.cmd.RustLsp('explainError')
end, { buffer = bufnr })

vim.keymap.set('n', '<Leader>ro', function()
  vim.cmd.RustLsp('openCargo')
end, { buffer = bufnr })

vim.keymap.set('n', '<Leader>r-', function()
  vim.cmd.RustLsp('parentModule')
end, { buffer = bufnr })
