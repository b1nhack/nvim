return {
	"rcarriga/nvim-notify",

	config = function()
		require("notify").setup({
			icons = {
				DEBUG = " ",
				ERROR = " ",
				INFO = " ",
				TRACE = " ",
				WARN = " ",
			},

			stages = "fade",
			timeout = 3000,
		})
	end,
}
