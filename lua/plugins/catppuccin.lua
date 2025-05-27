return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  lazy = false,

  init = function()
    vim.cmd.colorscheme('catppuccin')
  end,

  ---@module 'catppuccin'
  ---@type CatppuccinOptions
  opts = {
    flavour = 'macchiato',
    dim_inactive = {
      enabled = true, -- dims the background color of inactive window
      shade = 'dark',
      percentage = 0.20, -- percentage of the shade to apply to the inactive window
    },

    default_integrations = false,
    integrations = {
      treesitter = true,
      rainbow_delimiters = true,
      noice = true,

      semantic_tokens = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { 'italic' },
          hints = { 'italic' },
          warnings = { 'italic' },
          information = { 'italic' },
        },
        underlines = {
          errors = { 'underline' },
          hints = { 'underline' },
          warnings = { 'underline' },
          information = { 'underline' },
        },
        inlay_hints = {
          background = true,
        },
      },

      gitsigns = true,
      mini = {
        enabled = true,
        indentscope_color = 'lavender', -- catppuccin color (eg. `lavender`) Default: text
      },

      markdown = true,
      flash = true,
      lsp_trouble = true,
      nvim_surround = true,
      grug_far = true,
      snacks = {
        enabled = true,
        indent_scope_color = 'lavender', -- catppuccin color (eg. `lavender`) Default: text
      },
      blink_cmp = true,
    },
  },
}
