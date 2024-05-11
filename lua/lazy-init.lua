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
commands.install = nil
commands.update = nil
commands.clean = nil
commands.check = nil
commands.restore.button = false

-- https://github.com/folke/lazy.nvim/discussions/1196#discussioncomment-7761858
local user_grp = vim.api.nvim_create_augroup("LazyUserGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lazy",
	desc = "Quit lazy with <Esc>",
	callback = function()
		vim.keymap.set("n", "<Esc>", function()
			vim.api.nvim_win_close(0, false)
		end, { buffer = true, nowait = true })
	end,
	group = user_grp,
})

require("lazy").setup(
	"plugins",
	-- opts
	{
		defaults = {
			lazy = true, -- should plugins be lazy-loaded?
		},

		ui = {
			border = "rounded",
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
					"man",
					-- "matchit",
					-- "matchparen",
					"netrwPlugin",
					"osc52",
					"rplugin",
					"shada",
					"spellfile",
					"tarPlugin",
					"tohtml",
					"tutor",
					"zipPlugin",
				},
			},
		},
	}
)

vim.keymap.set("n", "<Leader>l", "<CMD>Lazy<CR>")
