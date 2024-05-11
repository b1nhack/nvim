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

			format_on_save = {
				-- These options will be passed to conform.format()
				async = true,
				lsp_fallback = false,
			},
		})

		vim.keymap.set("n", "<Leader>f", function()
			require("conform").format()
		end)
	end,
}
