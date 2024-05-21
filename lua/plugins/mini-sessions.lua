return {
	"echasnovski/mini.sessions",
	keys = {
		"<Leader>kw",
		"<Leader>ks",
		"<Leader>kd",
	},

	config = function()
		require("mini.sessions").setup({
			file = "",
			force = { read = false, write = true, delete = true },
		})

		vim.keymap.set("n", "<Leader>kw", function()
			local name = vim.fn.input("SessionName: ")
			MiniSessions.write(name)
		end)

		vim.keymap.set("n", "<Leader>ks", function()
			MiniSessions.select("read")
		end)

		vim.keymap.set("n", "<Leader>kd", function()
			MiniSessions.select("delete")
		end)
	end,
}
