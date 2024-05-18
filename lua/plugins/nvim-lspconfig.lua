return {
	"neovim/nvim-lspconfig",

	init = function()
		vim.diagnostic.config({
			virtual_text = false,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
				texthl = {
					[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
					[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
					[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
					[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
				},
				numhl = {
					[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
					[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
					[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
					[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
				},
			},
		})
	end,

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
	end,
}
