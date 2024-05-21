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
					"TelescopePrompt",
					"TelescopeResults",
					"checkhealth",
					"dap-repl",
					"dapui_breakpoints",
					"dapui_console",
					"dapui_scopes",
					"dapui_stacks",
					"dapui_watches",
					"dashboard",
					"gitcommit",
					"help",
					"lazy",
					"lspinfo",
					"man",
					"mason",
					"neotest-summary",
					"noice",
					"oil",
					"spectre_panel",
					"trouble",
				},

				buftypes = {
					"nofile",
					"prompt",
					"quickfix",
					"terminal",
				},
			},
		})
	end,
}
