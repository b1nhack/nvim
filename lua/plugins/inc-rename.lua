return {
	"smjonas/inc-rename.nvim",
	keys = {
		"<Leader>rn",
	},

	config = function()
		require("inc_rename").setup()

		vim.keymap.set("n", "<Leader>rn", ":IncRename ")
	end,
}
