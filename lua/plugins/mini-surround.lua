return {
	"echasnovski/mini.surround",
	version = false,
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },

	config = function()
		require("mini.surround").setup({
			highlight_duration = 3000,

			-- Module mappings. Use `''` (empty string) to disable one.
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "", -- Find surrounding (to the right)
				find_left = "", -- Find surrounding (to the left)
				highlight = "", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding
				update_n_lines = "gsl", -- Update `n_lines`

				suffix_last = "", -- Suffix to search with "prev" method
				suffix_next = "", -- Suffix to search with "next" method
			},
		})
	end,
}
