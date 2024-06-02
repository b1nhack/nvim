return {
	"echasnovski/mini.move",
	version = false,
	keys = {
		{ "<M-h>", mode = { "n", "x" } },
		{ "<M-b>", mode = { "n", "x" } },
		{ "<M-k>", mode = { "n", "x" } },
		{ "<M-m>", mode = { "n", "x" } },
	},

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
