return {
	"nvim-pack/nvim-spectre",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	cmd = "Spectre",
	keys = {
		"<Leader>s",
		"<Leader>S",
		{ "<Leader>s", mode = "x" },
	},

	config = function()
		require("spectre").setup({
			highlight = {
				ui = "Title",
				search = "diffRemoved",
				replace = "diffAdded",
			},

			mapping = {
				["tab"] = {
					map = "<Tab>",
					cmd = "<cmd>lua require('spectre').tab()<cr>",
					desc = "next query",
				},
				["shift-tab"] = {
					map = "<S-Tab>",
					cmd = "<cmd>lua require('spectre').tab_shift()<cr>",
					desc = "previous query",
				},
				["toggle_line"] = {
					map = "dd",
					cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
					desc = "toggle item",
				},
				["enter_file"] = {
					map = "<cr>",
					cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
					desc = "open file",
				},
				["send_to_qf"] = {
					map = "<Nop>",
				},
				["replace_cmd"] = {
					map = "<Nop>",
				},
				["show_option_menu"] = {
					map = "<Nop>",
				},
				["run_current_replace"] = {
					map = "r",
					cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
					desc = "replace current line",
				},
				["run_replace"] = {
					map = "R",
					cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
					desc = "replace all",
				},
				["change_view_mode"] = {
					map = "<C-p>",
					cmd = "<cmd>lua require('spectre').change_view()<CR>",
					desc = "change result view mode",
				},
				["change_replace_sed"] = {
					map = "<Nop>",
				},
				["change_replace_oxi"] = {
					map = "<Nop>",
				},
				["toggle_live_update"] = {
					map = "<Nop>",
				},
				["toggle_ignore_case"] = {
					map = "tc",
					cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
					desc = "toggle ignore case",
				},
				["toggle_ignore_hidden"] = {
					map = "th",
					cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
					desc = "toggle search hidden",
				},
				["resume_last_search"] = {
					map = "l",
					cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
					desc = "repeat last search",
				},
				-- you can put your mapping here it only use normal mode
			},

			is_insert_mode = true,
		})

		vim.keymap.set("n", "<Leader>s", '<cmd>lua require("spectre").toggle()<CR>', {
			desc = "Toggle Spectre",
		})
		vim.keymap.set("n", "<Leader>S", '<cmd>lua require("spectre").open_file_search()<CR>', {
			desc = "Search on current file",
		})
		vim.keymap.set("x", "<Leader>s", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
			desc = "Search current word",
		})
	end,
}
