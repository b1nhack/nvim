return {
	"echasnovski/mini.move",
	version = false,
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },

	config = function()
		require("mini.move").setup({
			mappings = {
				-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
				left = "<M-k>",
				right = "<M-m>",
				down = "<M-b>",
				up = "<M-h>",

				-- Move current line in Normal mode
				line_left = "<M-k>",
				line_right = "<M-m>",
				line_down = "<M-b>",
				line_up = "<M-h>",
			},
		})
	end,
}
