return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter",
	},
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	keys = {
		"<Leader>tt",
		"<Leader>tp",
		"<Leader>tl",
	},

	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("neotest").setup({
			adapters = {
				require("rustaceanvim.neotest"),
			},

			---@diagnostic disable-next-line: missing-fields
			summary = {
				mappings = {
					attach = "a",
					clear_marked = "M",
					clear_target = "T",
					debug = "d",
					debug_marked = "D",
					expand = "<CR>",
					expand_all = "<C-CR>",
					help = "?",
					jumpto = "o",
					mark = "m",
					next_failed = "b",
					output = "j",
					prev_failed = "h",
					run = "r",
					run_marked = "R",
					short = "J",
					stop = "s",
					target = "t",
					watch = "w",
				},
			},
		})

		vim.keymap.set("n", "<Leader>tt", function()
			require("neotest").summary.toggle()
		end)

		vim.keymap.set("n", "<Leader>tp", function()
			require("neotest").output_panel.toggle()
		end)

		vim.keymap.set("n", "<Leader>tl", function()
			require("neotest").output_panel.clear()
		end)
	end,
}
