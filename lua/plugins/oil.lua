return {
	"stevearc/oil.nvim",
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,

	config = function()
		require("oil").setup({
			cleanup_delay_ms = false,
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-s>"] = "actions.select_vsplit",
				["<C-h>"] = "actions.select_split",
				["<C-t>"] = "actions.select_tab",
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["<C-l>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["gs"] = "actions.change_sort",
				["gx"] = false,
				["g."] = "actions.toggle_hidden",
				["g\\"] = false,
			},
			-- Set to false to disable all of the above keymaps
			use_default_keymaps = false,
			git = {
				-- Return true to automatically git add/mv/rm files
				---@diagnostic disable-next-line: unused-local
				add = function(path)
					return true
				end,

				---@diagnostic disable-next-line: unused-local
				mv = function(src_path, dest_path)
					return true
				end,

				---@diagnostic disable-next-line: unused-local
				rm = function(path)
					return true
				end,
			},
		})

		vim.keymap.set("n", "<Leader>a", "<CMD>Oil<CR>")
	end,
}
