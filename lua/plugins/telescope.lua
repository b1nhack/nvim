return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"telescope-fzf-native.nvim",
	},
	cmd = "Telescope",
	keys = {
		"<Leader>ff",
		"<Leader>fg",
		"<Leader>fb",
		"<Leader>fh",

		"gr",
		"gd",
		"gy",
		"gi",
		"<Leader>fs",
		"<Leader>fd",
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				scroll_strategy = "limit",
				prompt_prefix = " ",
				selection_caret = " ",
				multi_icon = " ",

				default_mappings = {
					i = {
						["<C-c>"] = actions.close,

						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,

						["<CR>"] = actions.select_default,
						["<C-h>"] = actions.select_horizontal,
						["<C-s>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,

						["<C-u>"] = actions.preview_scrolling_up,
						["<C-e>"] = actions.preview_scrolling_down,
						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-l>"] = actions.complete_tag,
						["<C-/>"] = actions.which_key,
						["<C-j>"] = actions.nop,
					},
					n = {
						["<esc>"] = actions.close,
						["<CR>"] = actions.select_default,
						["<C-h>"] = actions.select_horizontal,
						["<C-s>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,

						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

						-- TODO: This would be weird if we switch the ordering.
						["e"] = actions.move_selection_next,
						["u"] = actions.move_selection_previous,
						["U"] = actions.move_to_top,
						["C"] = actions.move_to_middle,
						["E"] = actions.move_to_bottom,

						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,
						["gg"] = actions.move_to_top,
						["G"] = actions.move_to_bottom,

						["<C-u>"] = actions.preview_scrolling_up,
						["<C-e>"] = actions.preview_scrolling_down,
						["?"] = actions.which_key,
					},
				},
			},

			pickers = {
				find_files = { previewer = false },
				live_grep = { theme = "ivy" },

				lsp_references = { initial_mode = "normal", reuse_win = true, theme = "ivy" },
				lsp_definitions = { initial_mode = "normal", reuse_win = true, theme = "ivy" },
				lsp_type_definitions = { initial_mode = "normal", reuse_win = true, theme = "ivy" },
				lsp_implementations = { initial_mode = "normal", reuse_win = true, theme = "ivy" },
				lsp_dynamic_workspace_symbols = {},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("noice")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<Leader>ff", builtin.find_files)
		vim.keymap.set("n", "<Leader>fg", builtin.live_grep)
		vim.keymap.set("n", "<Leader>fb", builtin.buffers)
		vim.keymap.set("n", "<Leader>fh", builtin.help_tags)

		vim.keymap.set("n", "gr", builtin.lsp_references)
		vim.keymap.set("n", "gd", builtin.lsp_definitions)
		vim.keymap.set("n", "gy", builtin.lsp_type_definitions)
		vim.keymap.set("n", "gi", builtin.lsp_implementations)
		vim.keymap.set("n", "<Leader>fs", builtin.lsp_dynamic_workspace_symbols)
		vim.keymap.set("n", "<Leader>fd", builtin.diagnostics)
	end,
}
