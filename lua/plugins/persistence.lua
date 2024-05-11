return {
	"folke/persistence.nvim",
	event = "BufReadPre", -- this will only start session saving when an actual file was opened

	config = function()
		require("persistence").setup({
			options = { "buffers", "curdir", "folds", "help", "tabpages", "terminal", "winsize" },
		})
	end,
}
