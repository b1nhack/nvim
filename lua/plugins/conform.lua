return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = { "ConformInfo" },
	keys = {
		"<Leader>f",
	},

	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				sh = { "shfmt" },
				zsh = { "shfmt" },
				rust = { "rustfmt" },
				c = { "clang-format" },
				markdown = { "mdformat" },

				["*"] = { "injected" },
			},

			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})

		vim.keymap.set("n", "<Leader>f", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end)
	end,
}
