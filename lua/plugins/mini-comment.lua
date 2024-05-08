return {
	"echasnovski/mini.comment",
	version = "*",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },

	config = function()
		require("mini.comment").setup()
	end,
}
