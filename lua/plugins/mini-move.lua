return {
	"echasnovski/mini.move",
	version = "*",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },

	config = function()
		require("mini.move").setup({
			mappings = {
				-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
				left = "<C-k>",
				right = "<C-m>",
				down = "<C-b>",
				up = "<C-h>",

				-- Move current line in Normal mode
				line_left = "<C-k>",
				line_right = "<C-m>",
				line_down = "<C-b>",
				line_up = "<C-h>",
			},
		})
	end,
}
