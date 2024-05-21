return {
	"echasnovski/mini.indentscope",
	version = false,
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },

	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
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
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})

		vim.api.nvim_create_autocmd("BufEnter", {
			callback = function()
				local pattern = {
					"nofile",
					"prompt",
					"quickfix",
					"terminal",
				}

				for _, p in pairs(pattern) do
					if vim.bo.buftype == p then
						vim.b.miniindentscope_disable = true
					end
				end
			end,
		})
	end,

	config = function()
		require("mini.indentscope").setup({
			draw = {
				delay = 200,

				-- Animation rule for scope's first drawing. A function which, given
				-- next and total step numbers, returns wait time (in ms). See
				-- |MiniIndentscope.gen_animation| for builtin options. To disable
				-- animation, use `require('mini.indentscope').gen_animation.none()`.
				animation = require("mini.indentscope").gen_animation.none(),
			},
			mappings = {
				-- Textobjects
				object_scope = "kk",
				object_scope_with_border = "ak",

				-- Motions (jump to respective border line; if not present - body line)
				goto_top = "[k",
				goto_bottom = "]k",
			},

			options = { try_as_border = true },
			symbol = "│",
		})
	end,
}
