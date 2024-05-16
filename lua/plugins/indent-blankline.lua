return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },

	config = function()
		require("ibl").setup({
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"lspinfo",
					"checkhealth",
					"help",
					"man",
					"gitcommit",
					"TelescopePrompt",
					"TelescopeResults",
					"dashboard",
					"lazy",
					"mason",
					"oil",
					"neotest-summary",
					"noice",
					"dapui_scopes",
					"dapui_breakpoints",
					"dapui_stacks",
					"dapui_watches",
					"dap-repl",
					"dapui_console",
					"spectre_panel",
					"trouble",
				},

				buftypes = {
					"terminal",
					"nofile",
					"quickfix",
					"prompt",
				},
			},
		})
	end,
}
