return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  main = 'nvim-treesitter.configs',

  ---@module 'nvim-treesitter.configs'
  ---@type TSConfig
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'git_rebase',
      'gitcommit',
      'html',
      'ini',
      'json',
      'jsonc',
      'lua',
      'markdown',
      'markdown_inline',
      'nix',
      'python',
      'query',
      'regex',
      'rust',
      'toml',
      'vim',
      'vimdoc',
    },

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
      disable = function(_, bufnr)
        return vim.api.nvim_buf_line_count(bufnr) > 9999
      end,
    },

    incremental_selection = {
      enable = false,
    },

    indent = {
      enable = true,
    },

    textobjects = {
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          ['af'] = '@function.outer',
          ['kf'] = '@function.inner',
          ['ab'] = '@block.outer',
          ['kb'] = '@block.inner',
          ['aa'] = '@parameter.outer',
          ['ka'] = '@parameter.inner',
          ['ac'] = '@comment.outer',
        },

        -- If you set this to `true` (default is `false`) then any textobject is
        -- extended to include preceding or succeeding whitespace. Succeeding
        -- whitespace has priority in order to act similarly to eg the built-in
        -- `ap`.
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * selection_mode: eg 'v'
        -- and should return true or false
        include_surrounding_whitespace = false,
      },

      swap = {
        enable = false,
      },

      move = {
        enable = true,
        set_jumps = false, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']a'] = '@parameter.outer',
          [']f'] = '@function.outer',
          [']c'] = '@class.outer',
        },
        goto_previous_start = {
          ['[a'] = '@parameter.outer',
          ['[f'] = '@function.outer',
          ['[c'] = '@class.outer',
        },
      },
    },
  },
}
