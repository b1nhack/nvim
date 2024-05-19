return {
	"SmiteshP/nvim-navbuddy",
	dependencies = {
		{
			"SmiteshP/nvim-navic",

			config = function()
				require("nvim-navic").setup({
					highlight = true,
				})
			end,
		},
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
				File = icons.File,
				Module = icons.Module,
				Namespace = icons.Namespace,
				Package = icons.Package,
				Class = icons.Class,
				Method = icons.Method,
				Property = icons.Property,
				Field = icons.Field,
				Constructor = icons.Constructor,
				Enum = icons.Enum,
				Interface = icons.Interface,
				Function = icons.Function,
				Variable = icons.Variable,
				Constant = icons.Constant,
				String = icons.String,
				Number = icons.Number,
				Boolean = icons.Boolean,
				Array = icons.Array,
				Object = icons.Object,
				Key = icons.Key,
				Null = icons.Null,
				EnumMember = icons.EnumMember,
				Struct = icons.Struct,
				Event = icons.Event,
				Operator = icons.Operator,
				TypeParameter = icons.TypeParameter,
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

				["f"] = actions.fold_create(), -- Create fold of current scope
				["F"] = actions.fold_delete(), -- Delete fold of current scope

				["c"] = actions.comment(), -- Comment out current scope

				["<enter>"] = actions.select(), -- Goto selected symbol
				["o"] = actions.select(),

				["E"] = actions.move_down(), -- Move focused node down
				["U"] = actions.move_up(), -- Move focused node up

				["<C-p>"] = actions.toggle_preview(), -- Show preview of current node

				["<C-v>"] = actions.vsplit(), -- Open selected node in a vertical split
				["<C-h>"] = actions.hsplit(), -- Open selected node in a horizontal split

				["t"] = actions.telescope({ -- Fuzzy finder at current level.
					layout_config = { -- All options that can be
						height = 0.60, -- passed to telescope.nvim's
						width = 0.60, -- default can be passed here.
						prompt_position = "top",
						preview_width = 0.50,
					},
					layout_strategy = "horizontal",
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
