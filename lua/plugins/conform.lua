return {
  'stevearc/conform.nvim',
  event = 'BufWritePre',
  cmd = {
    'ConformInfo',
  },

  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,

  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      c = { 'clang-format' },
      lua = { 'stylua' },
      markdown = { 'mdformat' },
      rust = { 'rustfmt' },
      sh = { 'shfmt' },
      zsh = { 'shfmt' },
      python = { 'black' },
    },

    -- Set default options
    default_format_opts = {
      lsp_format = 'fallback',
      undojoin = true,
    },

    -- Set up format-on-save
    format_on_save = {
      timeout_ms = 500,
    },
  },
}
