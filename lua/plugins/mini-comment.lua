return {
	"echasnovski/mini.comment",
	version = "*",
	dependencies = {
		"nvim-ts-context-commentstring",
	},
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },

	config = function()
		require("mini.comment").setup({
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
				end,
			},
		})
	end,
}
