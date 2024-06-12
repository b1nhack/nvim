return {
	"echasnovski/mini.sessions",
	keys = {
		"<Leader>kw",
		"<Leader>ks",
		"<Leader>kd",
	},

	config = function()
		local function check_string(str)
			if str == nil or str == "" then
				vim.notify("SessionName cannot be empty", vim.log.levels.WARN)
				return false
			end

			if str:match("%W") then
				vim.notify("SessionName can only contain alphanumeric", vim.log.levels.WARN)
				return false
			end
			return true
		end

		require("mini.sessions").setup({
			file = "",
			force = { read = false, write = true, delete = true },
		})

		vim.keymap.set("n", "<Leader>kw", function()
			vim.ui.input({ prompt = "SessionName: " }, function(input)
				if check_string(input) then
					MiniSessions.write(input)
				end
			end)
		end)

		vim.keymap.set("n", "<Leader>ks", function()
			MiniSessions.select("read")
		end)

		vim.keymap.set("n", "<Leader>kd", function()
			MiniSessions.select("delete")
		end)
	end,
}
