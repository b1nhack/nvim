return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"mason.nvim",
	},

	config = function()
		require("mason-nvim-dap").setup({
			handlers = {},
		})
	end,
}
