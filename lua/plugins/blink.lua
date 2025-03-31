return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },
  -- use a release tag to download pre-built binaries
  version = '*',
  event = { 'InsertEnter', 'CmdlineEnter' },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'none',
      ['<C-u>'] = { 'select_prev', 'fallback' },
      ['<C-e>'] = { 'select_next', 'fallback' },
      ['<C-S-u>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-S-e>'] = { 'scroll_documentation_down', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },
      ['<Tab>'] = { 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      ['<C-k>'] = { 'cancel', 'fallback' },
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'normal',
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        path = { name = 'PATH', opts = { show_hidden_files_by_default = true } },
        snippets = {
          name = 'SNIP',
          should_show_items = function(ctx)
            return ctx.trigger.initial_kind ~= 'trigger_character'
          end,
        },
        buffer = { name = 'BUFF' },
        cmdline = { name = 'CMD' },
        omni = { name = 'OMNI' },
      },
      min_keyword_length = function(ctx)
        if ctx.get_mode() == 'cmdline' then
          return 2
        else
          return 0
        end
      end,
    },

    fuzzy = { implementation = 'rust' },
    completion = {
      menu = {
        border = 'rounded',
        draw = {
          columns = {
            { 'kind_icon' },
            { 'label', 'label_description', gap = 1 },
            { 'source_name' },
          },
          components = {
            kind_icon = {
              ellipsis = false,
              text = function(ctx)
                local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                return kind_icon
              end,
              -- Optionally, you may also use the highlights from mini.icons
              highlight = function(ctx)
                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                return hl
              end,
            },
            source_name = {
              ellipsis = false,
              width = { max = 4 },
            },
          },
          treesitter = { 'lsp' },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
        window = { border = 'rounded' },
      },
      ghost_text = { enabled = true },
    },

    cmdline = {
      completion = {
        list = { selection = { preselect = false } },
        menu = { auto_show = true },
      },
      keymap = {
        preset = 'none',
        ['<C-u>'] = { 'select_prev', 'fallback' },
        ['<C-e>'] = { 'select_next', 'fallback' },
        ['<C-k>'] = { 'cancel', 'fallback' },
      },
    },
  },
  opts_extend = { 'sources.default' },
}
