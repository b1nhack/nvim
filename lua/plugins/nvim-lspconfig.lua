return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"neodev.nvim",
		"mason.nvim",
		"mason-lspconfig.nvim",
	},
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },

	config = function()
		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local bufnr = ev.buf
				local client = vim.lsp.get_client_by_id(ev.data.client_id)

				local opts = { buffer = bufnr }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "j", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gk", vim.lsp.buf.signature_help, opts)
				vim.keymap.set({ "n", "x" }, "<C-CR>", vim.lsp.buf.code_action, opts)

				if client ~= nil then
					if client.server_capabilities.inlayHintProvider then
						vim.lsp.inlay_hint.enable()

						vim.keymap.set("n", "<Leader>h", function()
							local current_setting = vim.lsp.inlay_hint.is_enabled({ bufnr })
							vim.lsp.inlay_hint.enable(not current_setting, { bufnr = bufnr })
						end, { buffer = bufnr, desc = "[lsp] toggle inlay hints" })
					end
				end
			end,
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("mason-lspconfig").setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
				})
			end,

			["lua_ls"] = function()
				require("lsp.lua_ls")
			end,
		})

		local signs = { Error = " ", Warn = " ", Hint = "󰌶 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end
	end,
}
