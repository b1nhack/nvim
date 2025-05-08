return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
  },

  ---@module 'noice'
  ---@type NoiceConfig
  opts = {
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
      },
    },

    routes = {
      {
        view = 'mini',
        filter = { event = 'msg_showmode' },
      },

      {
        filter = {
          event = 'msg_show',
          any = {
            { find = '%d+ lines, %d+ bytes written' },
            { find = '; after #%d+' },
            { find = '; before #%d+' },
          },
        },
        view = 'mini',
      },

      {
        filter = {
          event = 'msg_show',
          any = {
            { find = 'E385: Search hit BOTTOM without match for: ' },
            { find = 'E384: Search hit TOP without match for: ' },
          },
        },
        skip = true,
      },
    },

    -- you can enable a preset for easier configuration
    presets = {
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      lsp_doc_border = true, -- add a border to hover docs and signature help
    },
  },
}
