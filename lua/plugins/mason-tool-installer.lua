return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = "mason.nvim",
	cmd = {
		"MasonToolsInstall",
		"MasonToolsInstallSync",
		"MasonToolsUpdate",
		"MasonToolsUpdateSync",
		"MasonToolsClean",
	},

	config = function()
		require("mason-tool-installer").setup({
			-- a list of all tools you want to ensure are installed upon
			-- start
			ensure_installed = {
				-- LSP
				"lua_ls",

				-- DAP
				"codelldb",

				-- Formatter
				"stylua",
				"shfmt",
			},

			-- automatically install / update on startup. If set to false nothing
			-- will happen on startup. You can use :MasonToolsInstall or
			-- :MasonToolsUpdate to install tools and check for updates.
			-- Default: true
			run_on_start = false,
		})
	end,
}
