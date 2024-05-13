return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	keys = {
		"<Leader>f",
	},

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				sh = { "shfmt" },
				zsh = { "shfmt" },
				rust = { "rustfmt" },
				c = { "clang-format" },
			},
		})

		vim.keymap.set("n", "<Leader>f", function()
			require("conform").format({ async = true })
		end)
	end,
}
