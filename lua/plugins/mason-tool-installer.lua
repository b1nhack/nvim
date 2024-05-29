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
				"clangd",
				"lua_ls",
				"marksman",
				"zls",

				-- DAP
				"codelldb",

				-- Formatter
				"clang-format",
				"mdformat",
				"shfmt",
				"stylua",
			},
		})
	end,
}
