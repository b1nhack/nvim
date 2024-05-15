return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",

	config = function()
		local logo = [[
		███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗     
 		████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║     
		██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║     
		██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║     
		██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║     
		╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ @b1n
]]
		logo = string.rep("\n", 9) .. string.rep("\n", 9) .. logo .. string.rep("\n", 3)

		require("dashboard").setup({
			theme = "doom",
			hide = {
				statusline = false,
			},

			config = {
				header = vim.split(logo, "\n"),
				-- stylua: ignore
				center = {
					{ action = 'lua require"telescope-function".project_files()',                   desc = " Find File",       icon = " ", key = "f" },
					{ action = "ene | startinsert",                                                 desc = " New File",        icon = " ", key = "k" },
					{ action = "Telescope oldfiles",                                                desc = " Recent Files",    icon = " ", key = "o" },
					{ action = 'lua require"telescope-function".live_grep_from_project_git_root()', desc = " Find Text",       icon = " ", key = "g" },
					{ action = "Oil ~/.config/nvim",                                                desc = " Config",          icon = " ", key = "c" },
					{ action = 'lua require("persistence").load()',                                 desc = " Restore Session", icon = " ", key = "s" },
					{ action = "Lazy",                                                              desc = " Lazy",            icon = "󰒲 ", key = "l" },
					{ action = "Mason",                                                             desc = " Mason",           icon = "󰫺 ", key = "m" },
					{ action = "qa",                                                                desc = " Quit",            icon = " ", key = "q" },
				},
				footer = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
				end,
			},
		})
	end,
}
