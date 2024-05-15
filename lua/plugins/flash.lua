return {
	"folke/flash.nvim",
	event = "VeryLazy",
		-- stylua: ignore
	keys = {
		{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash", },
		{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter", },
		{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash", },
		{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search", },
		{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search", },
	},

	config = function()
		require("flash").setup({
			labels = "arstdhneioqwfpgjluyzxcvbkm",

			search = {
				multi_window = false,

				mode = function(str)
					return "\\<" .. str
				end,
			},

			jump = {
				autojump = true,
			},

			label = {
				rainbow = {
					enabled = true,
					-- number between 1 and 9
					shade = 3,
				},
			},

			modes = {
				search = {
					enabled = true,
				},

				char = {
					jump_labels = true,
					multi_line = false,
					label = { exclude = "uenikardc" },
				},

				treesitter = {
					labels = "arstdhneioqwfpgjluyzxcvbkm",
				},
			},

			prompt = {
				zindex = 999,
			},
		})
	end,
}
