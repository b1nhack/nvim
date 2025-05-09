vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})
vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})

return {
  'stevearc/conform.nvim',
  event = 'BufWritePre',
  cmd = 'ConformInfo',
  -- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#leave-visual-mode-after-range-format
  keys = {
    {
      '<Leader>f',
      function()
        require('conform').format({ async = true }, function(err)
          if not err then
            local mode = vim.api.nvim_get_mode().mode
            if vim.startswith(string.lower(mode), 'v') then
              vim.api.nvim_feedkeys(
                vim.api.nvim_replace_termcodes('<Esc>', true, false, true),
                'n',
                true
              )
            end
          end
        end)
      end,
      mode = { 'n', 'x' },
      desc = 'Format buffer',
    },
  },

  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,

  -- This will provide type hinting with LuaLS
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      c = { 'clang-format' },
      h = { 'clang-format' },
      lua = { 'stylua' },
      markdown = { 'mdformat' },
      nix = { 'nixfmt' },
      python = { 'black' },
      rust = { 'rustfmt' },
      sh = { 'shfmt' },
      zsh = { 'shfmt' },

      ['_'] = { 'trim_whitespace' },
    },

    -- Set default options
    default_format_opts = {
      lsp_format = 'fallback',
      undojoin = true,
    },

    -- Set up format-on-save
    format_on_save = function(bufnr)
      -- Disable autoformat on certain filetypes
      local ignore_filetypes = { 'c', 'h' }
      if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
        return
      end

      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 500, lsp_format = 'fallback' }
    end,
  },
}
