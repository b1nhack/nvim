return {
	"SmiteshP/nvim-navbuddy",
	dependencies = {
		"nvim-navic",
		"MunifTanjim/nui.nvim",
	},

	config = function()
		local navbuddy = require("nvim-navbuddy")
		local actions = require("nvim-navbuddy.actions")
		local icons = require("global").icons

		navbuddy.setup({
			window = {
				border = "rounded", -- "rounded", "double", "solid", "none"
				-- or an array with eight chars building up the border in a clockwise fashion
				-- starting with the top-left corner. eg: { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }.
				size = "59%", -- Or table format example: { height = "40%", width = "100%"}
				position = "59%", -- Or table format example: { row = "100%", col = "0%"}
				sections = {
					left = {
						size = "19%",
					},
					mid = {
						size = "39%",
					},
					right = {
						-- No size option for right most section. It fills to
						-- remaining area.
						preview = "leaf", -- Right section can show previews too.
						-- Options: "leaf", "always" or "never"
					},
				},
			},
			node_markers = {
				enabled = true,
				icons = {
					leaf = "󰌪 ",
					leaf_selected = " ",
					branch = " ",
				},
			},
			icons = {
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
			use_default_mappings = false, -- If set to false, only mappings set
			-- by user are set. Else default
			-- mappings are used for keys
			-- that are not set by user
			mappings = {
				["<esc>"] = actions.close(), -- Close and cursor to original location
				["q"] = actions.close(),

				["e"] = actions.next_sibling(), -- down
				["u"] = actions.previous_sibling(), -- up

				["n"] = actions.parent(), -- Move to left panel
				["i"] = actions.children(), -- Move to right panel
				["0"] = actions.root(), -- Move to first panel

				["v"] = actions.visual_name(), -- Visual selection of name
				["V"] = actions.visual_scope(), -- Visual selection of scope

				["y"] = actions.yank_name(), -- Yank the name to system clipboard "+
				["Y"] = actions.yank_scope(), -- Yank the scope to system clipboard "+

				["k"] = actions.insert_name(), -- Insert at start of name
				["K"] = actions.insert_scope(), -- Insert at start of scope

				["a"] = actions.append_name(), -- Insert at end of name
				["A"] = actions.append_scope(), -- Insert at end of scope

				["r"] = actions.rename(), -- Rename currently focused symbol

				["d"] = actions.delete(), -- Delete scope

				["zc"] = actions.fold_create(), -- Create fold of current scope
				["zo"] = actions.fold_delete(), -- Delete fold of current scope

				["gcc"] = actions.comment(), -- Comment out current scope

				["<Enter>"] = actions.select(), -- Goto selected symbol
				["o"] = actions.select(),

				["<M-b>"] = actions.move_down(), -- Move focused node down
				["<M-h>"] = actions.move_up(), -- Move focused node up

				["<C-p>"] = actions.toggle_preview(), -- Show preview of current node

				["<C-v>"] = actions.vsplit(), -- Open selected node in a vertical split
				["<C-s>"] = actions.hsplit(), -- Open selected node in a horizontal split

				["t"] = actions.telescope({ -- Fuzzy finder at current level.
					layout_config = { -- All options that can be
						height = 0.59, -- passed to telescope.nvim's
						width = 0.59, -- default can be passed here.
						prompt_position = "top",
					},
					layout_strategy = "flex",
				}),

				["g?"] = actions.help(), -- Open mappings help window
			},
			lsp = {
				auto_attach = true, -- If set to true, you don't need to manually use attach function
			},
		})

		vim.keymap.set("n", "<Leader>g", "<CMD>Navbuddy<CR>")
	end,
}
