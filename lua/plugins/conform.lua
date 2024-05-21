return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = { "ConformInfo" },
	keys = {
		"<Leader>f",
	},

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang-format" },
				lua = { "stylua" },
				markdown = { "mdformat" },
				rust = { "rustfmt" },
				sh = { "shfmt" },
				zsh = { "shfmt" },

				["*"] = { "injected" },
			},

			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})

		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

		vim.keymap.set("n", "<Leader>f", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end)
	end,
}
