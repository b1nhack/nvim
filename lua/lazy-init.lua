local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local commands = require("lazy.view.config").commands
commands.clean = nil
commands.install = nil
commands.restore.button = false
commands.check.key_plugin = "c"
commands.check.key = "C"
commands.update.key_plugin = "o"
commands.update.key = "O"

require("lazy").setup(
	"plugins",
	-- opts
	{
		defaults = {
			lazy = true, -- should plugins be lazy-loaded?
		},

		local_spec = false,

		pkg = {
			sources = {
				"lazy",
				"packspec",
			},
		},

		ui = {
			custom_keys = {
				-- You can define custom key maps here. If present, the description will
				-- be shown in the help menu.
				-- To disable one of the defaults, set it to false.

				["<localleader>l"] = false,
				["<localleader>t"] = false,
			},
		},

		checker = {
			enabled = true,
		},

		change_detection = {
			notify = false, -- get a notification when changes are found
		},

		performance = {
			rtp = {
				disabled_plugins = {
					"editorconfig",
					"gzip",
					"netrwPlugin",
					"osc52",
					"rplugin",
					"shada",
					"spellfile",
					"tarPlugin",
					"tohtml",
					"tutor",
					"zipPlugin",
					-- "man",
					-- "matchit",
					-- "matchparen",
				},
			},
		},
	}
)

vim.keymap.set("n", "<Leader>l", "<CMD>Lazy<CR>")
