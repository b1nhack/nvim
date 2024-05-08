return {
	"echasnovski/mini.surround",
	version = "*",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },

	config = function()
		require("mini.surround").setup({
			mappings = {
				update_n_lines = "sl", -- Update `n_lines`
			},
		})
	end,
}
