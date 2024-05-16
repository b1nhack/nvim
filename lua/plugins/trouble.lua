return {
	"folke/trouble.nvim",
	branch = "dev", -- IMPORTANT!
	keys = {
		"<Leader>fs",
		"<Leader>fD",
		"<Leader>fd",

		"<Leader>fx",
		"<Leader>fX",
	},

	config = function()
		require("trouble").setup({
			focus = true,

			-- Key mappings can be set to the name of a builtin action,
			-- or you can define your own custom action.
			---@type table<string, string|trouble.Action>
			keys = {
				["?"] = "help",
				r = "refresh",
				R = "toggle_refresh",
				q = "close",
				o = "jump_close",
				["<esc>"] = "close",
				["<cr>"] = "jump",
				-- ["<2-leftmouse>"] = "",
				-- ["<c-s>"] = "",
				["<c-h>"] = "jump_split",
				["<c-v>"] = "jump_vsplit",
				-- go down to next item (accepts count)
				-- e = "next",
				["}"] = "next",
				["]]"] = "next",
				-- go up to prev item (accepts count)
				-- u = "prev",
				["{"] = "prev",
				["[["] = "prev",
				i = "inspect",
				p = "preview",
				P = "toggle_preview",
				zo = "fold_open",
				zO = "fold_open_recursive",
				zc = "fold_close",
				zC = "fold_close_recursive",
				za = "fold_toggle",
				zA = "fold_toggle_recursive",
				-- zm = "fold_more",
				-- zM = "fold_close_all",
				-- zr = "fold_reduce",
				-- zR = "fold_open_all",
				-- zx = "fold_update",
				-- zX = "fold_update_all",
				-- zn = "fold_disable",
				-- zN = "fold_enable",
				-- zi = "fold_toggle_enable",
			},

			---@type table<string, trouble.Mode>
			modes = {
				symbols = {
					focus = true,
				},
			},
			icons = {
				---@type trouble.Indent.symbols
				indent = {
					fold_open = " ",
					fold_closed = " ",
				},
				folder_closed = " ",
				folder_open = " ",
				kinds = {
					Array = " ",
					Boolean = " ",
					Class = " ",
					Constant = " ",
					Constructor = " ",
					Enum = " ",
					EnumMember = " ",
					Event = " ",
					Field = " ",
					File = " ",
					Function = "󰡱 ",
					Interface = " ",
					Key = " ",
					Method = " ",
					Module = "󰰏 ",
					Namespace = " ",
					Null = "󰟢 ",
					Number = " ",
					Object = "󰰕 ",
					Operator = " ",
					Package = " ",
					Property = " ",
					String = " ",
					Struct = " ",
					TypeParameter = " ",
					Variable = " ",
				},
			},
		})

		vim.keymap.set("n", "<Leader>fs", "<cmd>Trouble symbols toggle<cr>")
		vim.keymap.set("n", "<Leader>fD", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
		vim.keymap.set("n", "<Leader>fd", "<cmd>Trouble diagnostics toggle<cr>")

		vim.keymap.set("n", "<Leader>fx", "<cmd>Trouble qflist toggle<cr>")
		vim.keymap.set("n", "<Leader>fX", "<cmd>Trouble loclist toggle<cr>")
	end,
}
