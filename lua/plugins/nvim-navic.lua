return {
	"SmiteshP/nvim-navic",

	config = function()
		local icons = require("global").icons

		require("nvim-navic").setup({
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

			lsp = {
				auto_attach = true,
			},

			highlight = true,
			separator = "  ",
		})
	end,
}
