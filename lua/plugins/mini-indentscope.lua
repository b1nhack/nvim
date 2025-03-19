return {
  'echasnovski/mini.indentscope',
  version = false,
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },

  init = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = require('config.global').exclude_types,
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })

    vim.api.nvim_create_autocmd('BufEnter', {
      callback = function()
        local pattern = {
          'nofile',
          'prompt',
          'quickfix',
          'terminal',
        }

        for _, p in pairs(pattern) do
          if vim.bo.buftype == p then
            vim.b.miniindentscope_disable = true
          end
        end
      end,
    })
  end,

  opts = {
    draw = {
      delay = 200,

      -- Animation rule for scope's first drawing. A function which, given
      -- next and total step numbers, returns wait time (in ms). See
      -- |MiniIndentscope.gen_animation| for builtin options. To disable
      -- animation, use `require('mini.indentscope').gen_animation.none()`.
      animation = function()
        return require('mini.indentscope').gen_animation.none()()
      end,
    },
    mappings = {
      -- Textobjects
      object_scope = 'kk',
      object_scope_with_border = 'ak',

      -- Motions (jump to respective border line; if not present - body line)
      goto_top = '[k',
      goto_bottom = ']k',
    },

    options = { try_as_border = true },
    symbol = '│',
  },
}
