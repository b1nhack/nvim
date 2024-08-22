return {
  'williamboman/mason.nvim',
  cmd = {
    'Mason',
    'MasonUpdate',
    'MasonInstall',
    'MasonUninstall',
    'MasonUninstallAll',
    'MasonLog',
  },
  keys = {
    '<Leader>m',
  },

  config = function()
    require('mason').setup({
      ui = {
        check_outdated_packages_on_open = false,

        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },

        keymaps = {
          ---@since 1.0.0
          -- Keymap to expand a package
          toggle_package_expand = '<CR>',
          ---@since 1.0.0
          -- Keymap to install the package under the current cursor position
          install_package = 'j',
          ---@since 1.0.0
          -- Keymap to reinstall/update the package under the current cursor position
          update_package = 'o',
          ---@since 1.0.0
          -- Keymap to check for new version for the package under the current cursor position
          check_package_version = 'c',
          ---@since 1.0.0
          -- Keymap to update all installed packages
          update_all_packages = 'O',
          ---@since 1.0.0
          -- Keymap to check which installed packages are outdated
          check_outdated_packages = 'C',
          ---@since 1.0.0
          -- Keymap to uninstall a package
          uninstall_package = 'x',
          ---@since 1.0.0
          -- Keymap to cancel a package installation
          cancel_installation = '<C-c>',
          ---@since 1.0.0
          -- Keymap to apply language filter
          apply_language_filter = '<C-f>',
          ---@since 1.1.0
          -- Keymap to toggle viewing package installation log
          toggle_package_install_log = '<CR>',
          ---@since 1.8.0
          -- Keymap to toggle the help view
          toggle_help = '?',
        },
      },
    })

    vim.keymap.set('n', '<Leader>m', '<CMD>Mason<CR>')
  end,
}
