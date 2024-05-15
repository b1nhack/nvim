return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,

	config = function()
		require("catppuccin").setup({
			flavour = "macchiato",
			dim_inactive = {
				enabled = true, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},

			default_integrations = false,
			integrations = {
				cmp = true,
				mason = true,
				treesitter = true,
				rainbow_delimiters = true,
				noice = true,
				illuminate = {
					enabled = true,
					lsp = false,
				},

				notify = true,
				telescope = {
					enabled = true,
					-- style = "nvchad"
				},

				semantic_tokens = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},

				gitsigns = true,
				mini = {
					enabled = true,
					indentscope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
				},

				dap = true,
				dap_ui = true,
				markdown = true,
				neotest = true,
				treesitter_context = true,
				flash = true,
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
