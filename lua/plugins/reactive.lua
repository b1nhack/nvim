return {
	"rasulomaroff/reactive.nvim",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },

	config = function()
		require("reactive").setup({
			load = { "catppuccin-macchiato-cursor", "catppuccin-macchiato-cursorline" },
		})
	end,
}
