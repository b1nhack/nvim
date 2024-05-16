return {
	"JoosepAlviste/nvim-ts-context-commentstring",

	init = function()
		vim.g.skip_ts_context_commentstring_module = true
	end,

	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("ts_context_commentstring").setup({
			enable_autocmd = false,
		})
	end,
}
