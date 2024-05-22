return {
	"mrcjkb/rustaceanvim",
	version = "^4", -- Recommended
	ft = "rust",

	config = function()
		vim.g.rustaceanvim = {
			---@type RustaceanToolsOpts
			tools = {
				test_executor = "neotest",
			},
		}
	end,
}
