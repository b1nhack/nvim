return {
	"echasnovski/mini.bufremove",
	version = "*",
	keys = {
		"<Leader>bd",
	},

	config = function()
		local bufremove = require("mini.bufremove")
		bufremove.setup()

		vim.keymap.set("n", "<Leader>bd", function()
			bufremove.delete()
		end)
	end,
}
