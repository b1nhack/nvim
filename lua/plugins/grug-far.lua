return {
	"MagicDuck/grug-far.nvim",
	cmd = {
		"GrugFar",
	},
	keys = {
		{ "<Leader>s", mode = { "n", "x" } },
		{ "<Leader>S", mode = { "n", "x" } },
	},

	config = function()
		local grug_far = require("grug-far")

		grug_far.setup({
			minSearchChars = 3,
			searchOnInsertLeave = true,
			maxWorkers = 9,
			windowCreationCommand = "tabnew %",
			wrap = false,
			transient = true,
			history = {
				maxHistoryLines = 9999,
			},
		})

		vim.keymap.set("n", "<Leader>s", function()
			grug_far.grug_far()
		end)

		vim.keymap.set("x", "<Leader>s", function()
			grug_far.grug_far({
				prefills = {
					search = vim.fn.expand("<cword>"),
				},
			})
		end)

		vim.keymap.set("n", "<Leader>S", function()
			grug_far.grug_far({
				prefills = {
					paths = vim.fn.expand("%"),
				},
			})
		end)

		vim.keymap.set("x", "<Leader>S", function()
			grug_far.grug_far({
				prefills = {
					search = vim.fn.expand("<cword>"),
					paths = vim.fn.expand("%"),
				},
			})
		end)
	end,
}
