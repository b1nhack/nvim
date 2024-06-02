return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files

		config = function()
			require("lazydev").setup({
				library = {
					vim.env.LAZY .. "/luvit-meta/library", -- see below
					-- You can also add plugins you always want to have loaded.
					-- Useful if the plugin has globals or types you want to use
					-- vim.env.LAZY .. "/LazyVim", -- see below
				},
			})
		end,
	},
	"Bilal2453/luvit-meta", -- optional `vim.uv` typings
}
