return {
	"stevearc/oil.nvim",
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",

	config = function()
		require("oil").setup({
			---@diagnostic disable-next-line: assign-type-mismatch
			cleanup_delay_ms = false,
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-v>"] = "actions.select_vsplit",
				["<C-s>"] = "actions.select_split",
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
		})

		vim.keymap.set("n", "<Leader>a", "<CMD>Oil<CR>")
	end,
}
