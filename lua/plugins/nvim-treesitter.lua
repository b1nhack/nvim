return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  -- TODO: remove when default branch is main
  branch = 'main',
  build = ':TSUpdate',

  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        -- bash
        'sh',
        'zsh',
        -- c
        'c',
        -- diff
        'diff',
        -- git_rebase
        'gitrebase',
        -- gitcommit
        'gitcommit',
        -- html
        'html',
        -- ini
        'dosini',
        -- json
        'json',
        -- jsonc
        'jsonc',
        -- lua
        'lua',
        -- markdown markdown_inline
        'markdown',
        -- nix
        'nix',
        -- python
        'python',
        -- query
        'scheme',
        -- regex
        'regex',
        -- rust
        'rust',
        -- toml
        'toml',
        -- vim
        'vim',
        -- vimdoc
        'vimdoc',
      },

      callback = function()
        -- syntax highlighting, provided by Neovim
        vim.treesitter.start()
        -- folds, provided by Neovim
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

    require('nvim-treesitter').install({
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
    })

    vim.treesitter.language.register('bash', { 'zsh' })
    vim.treesitter.language.register('ini', { 'dosini' })
    vim.treesitter.language.register('query', { 'scheme' })
  end,
}
