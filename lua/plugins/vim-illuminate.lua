return {
	"RRethy/vim-illuminate",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },

	config = function()
		require("illuminate").configure({
			delay = 199,
			large_file_cutoff = 1999,
			large_file_overrides = {
				providers = { "lsp" },
			},
		})
	end,
}
