return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },

	config = function()
		local configs = require("nvim-treesitter.configs")

		---@diagnostic disable-next-line: missing-fields
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
				"json",
				"jsonc",
			},
			sync_install = false,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				disable = function(_, bufnr)
					return vim.api.nvim_buf_line_count(bufnr) > 9999
				end,
			},

			incremental_selection = {
				enable = false,
			},

			indent = {
				enable = true,
			},

			textobjects = {
				select = {
					enable = true,

					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,

					keymaps = {
						["af"] = "@function.outer",
						["kf"] = "@function.inner",
						["ab"] = "@block.outer",
						["kb"] = "@block.inner",
						["aa"] = "@parameter.outer",
						["ka"] = "@parameter.inner",
						["ac"] = "@comment.outer",
					},

					-- If you set this to `true` (default is `false`) then any textobject is
					-- extended to include preceding or succeeding whitespace. Succeeding
					-- whitespace has priority in order to act similarly to eg the built-in
					-- `ap`.
					--
					-- Can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * selection_mode: eg 'v'
					-- and should return true or false
					include_surrounding_whitespace = false,
				},

				swap = {
					enable = false,
				},

				move = {
					enable = true,
					set_jumps = false, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]a"] = "@parameter.outer",
						["]f"] = "@function.outer",
						["]c"] = "@class.outer",
					},
					goto_previous_start = {
						["[a"] = "@parameter.outer",
						["[f"] = "@function.outer",
						["[c"] = "@class.outer",
					},
				},
			},
		})

		vim.keymap.set("n", "[g", function()
			require("treesitter-context").go_to_context(vim.v.count1)
		end)
	end,
}
