return {
	"stevearc/dressing.nvim",
	event = "VeryLazy",

	config = function()
		require("dressing").setup({
			input = {
				title_pos = "center",
			},

			select = {
				backend = { "nui", "builtin" },
			},
		})
	end,
}
