return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	cmd = {
		"TodoQuickFix",
		"TodoLocList",
		"TodoTelescope",
	},

	config = function()
		require("todo-comments").setup({
			sign_priority = 99, -- sign priority

			-- keywords recognized as todo comments
			keywords = {
				FIX = {
					icon = " ", -- icon used for the sign, and in search results
					color = "error", -- can be a hex color, or a named color (see below)
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
					-- signs = false, -- configure signs for some keywords individually
				},
				TODO = { icon = " ", color = "hint" },
				HACK = { icon = "󰱯 ", color = "ok" },
				WARN = { icon = " ", color = "warn", alt = { "WARNING", "XXX" } },
				PERF = { icon = " ", color = "error", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = "info", alt = { "INFO" } },
				TEST = { icon = " ", color = "ok", alt = { "TESTING", "PASSED", "FAILED" } },
			},

			colors = {
				error = "DiagnosticSignError",
				warn = "DiagnosticSignWarn",
				info = "DiagnosticSignInfo",
				hint = "DiagnosticSignHint",
				ok = "DiagnosticSignOk",
			},

			-- highlighting of the line containing the todo comment
			-- * before: highlights before the keyword (typically comment characters)
			-- * keyword: highlights of the keyword
			-- * after: highlights after the keyword (todo text)
			highlight = {
				multiline = false, -- enable multine todo comments
			},
		})
	end,
}
