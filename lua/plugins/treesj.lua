return {
	"Wansmer/treesj",
	dependencies = {
		"nvim-treesitter",
	},
	keys = {
		"J",
	},

	config = function()
		local treesj = require("treesj")

		treesj.setup({
			use_default_keymaps = false,
		})

		vim.keymap.set("n", "J", function()
			treesj.toggle()
		end)
	end,
}
