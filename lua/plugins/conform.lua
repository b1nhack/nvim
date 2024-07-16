return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = {
		"ConformInfo",
	},

	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,

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
				-- I recommend these options. See :help conform.format for details.
				lsp_format = "fallback",
				timeout_ms = 500,
				undojoin = true,
			},
		})
	end,
}
