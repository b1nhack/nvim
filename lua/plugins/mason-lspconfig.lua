return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"nvim-navbuddy",
		"neoconf.nvim",
		"mason.nvim",
		"neovim/nvim-lspconfig",
		"mason-tool-installer.nvim",
	},
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },

	config = function()
		local mason_lspconfig = require("mason-lspconfig")
		mason_lspconfig.setup()

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		mason_lspconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
				})
			end,

			["lua_ls"] = function()
				require("lsp.lua_ls")
			end,
		})
	end,
}
