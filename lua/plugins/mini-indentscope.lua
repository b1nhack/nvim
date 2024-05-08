return {
	"echasnovski/mini.indentscope",
	version = "*",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },

	config = function()
		require("mini.indentscope").setup({
			draw = {
				-- Animation rule for scope's first drawing. A function which, given
				-- next and total step numbers, returns wait time (in ms). See
				-- |MiniIndentscope.gen_animation| for builtin options. To disable
				-- animation, use `require('mini.indentscope').gen_animation.none()`.
				animation = require("mini.indentscope").gen_animation.none(),
			},
			mappings = {
				-- Textobjects
				object_scope = "kk",
				object_scope_with_border = "ak",

				-- Motions (jump to respective border line; if not present - body line)
				goto_top = "[k",
				goto_bottom = "]k",
			},
		})
	end,
}
