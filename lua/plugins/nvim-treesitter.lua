return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },

	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"rust",
				"regex",
				"bash",
				"markdown",
				"markdown_inline",
				"toml",
				"ron",
			},
			sync_install = false,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn", -- set to `false` to disable one of the mappings
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},

			indent = { enable = true },
		})
	end,
}
