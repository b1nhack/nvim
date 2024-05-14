return {
	"smjonas/inc-rename.nvim",
	keys = {
		"<Leader>rn",
	},

	config = function()
		require("inc_rename").setup({
			save_in_cmdline_history = false,
		})

		vim.keymap.set("n", "<Leader>rn", ":IncRename ")
	end,
}
