return {
	"folke/trouble.nvim",
	branch = "dev", -- IMPORTANT!
	keys = {
		"<Leader>fs",
		"<Leader>fd",
		"<Leader>fD",

		"<Leader>fx",
		"<Leader>fX",
	},

	config = function()
		local icons = require("global").icons

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
					fold_closed = " ",
				},
				folder_closed = " ",
				folder_open = " ",
				kinds = {
					Array = icons.Array,
					Boolean = icons.Boolean,
					Class = icons.Class,
					Constant = icons.Constant,
					Constructor = icons.Constructor,
					Enum = icons.Enum,
					EnumMember = icons.EnumMember,
					Event = icons.Event,
					Field = icons.Field,
					File = icons.File,
					Function = icons.Function,
					Interface = icons.Interface,
					Key = icons.Key,
					Method = icons.Method,
					Module = icons.Module,
					Namespace = icons.Namespace,
					Null = icons.Null,
					Number = icons.Number,
					Object = icons.Object,
					Operator = icons.Operator,
					Package = icons.Package,
					Property = icons.Property,
					String = icons.String,
					Struct = icons.Struct,
					TypeParameter = icons.TypeParameter,
					Variable = icons.Variable,
				},
			},
		})

		vim.keymap.set("n", "<Leader>fs", "<CMD>Trouble symbols toggle<CR>")
		vim.keymap.set("n", "<Leader>fd", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>")
		vim.keymap.set("n", "<Leader>fD", "<CMD>Trouble diagnostics toggle<CR>")

		vim.keymap.set("n", "<Leader>fx", "<CMD>Trouble loclist toggle<CR>")
		vim.keymap.set("n", "<Leader>fX", "<CMD>Trouble qflist toggle<CR>")
	end,
}
