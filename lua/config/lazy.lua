-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
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

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
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
		wrap = false,
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
		-- automatically check for config file changes and reload the ui
		enabled = false,
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
})

vim.keymap.set("n", "<Leader>l", "<CMD>Lazy<CR>")
