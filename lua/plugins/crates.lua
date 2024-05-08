return {
	"saecki/crates.nvim",
	event = { "BufRead Cargo.toml" },

	config = function()
		require("crates").setup({
			lsp = {
				enabled = true,

				---@diagnostic disable-next-line: unused-local
				on_attach = function(client, bufnr)
					-- the same on_attach function as for your other lsp's
					local crates = require("crates")

					vim.keymap.set("n", "<leader>ct", crates.toggle, { buffer = bufnr })
					vim.keymap.set("n", "<leader>cr", crates.reload, { buffer = bufnr })

					vim.keymap.set("n", "<leader>ci", crates.show_popup, { buffer = bufnr })
					vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, { buffer = bufnr })
					vim.keymap.set("n", "<leader>cf", crates.show_features_popup, { buffer = bufnr })
					vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup, { buffer = bufnr })

					vim.keymap.set("n", "<leader>cu", crates.update_crate, { buffer = bufnr })
					vim.keymap.set("v", "<leader>cu", crates.update_crates, { buffer = bufnr })
					vim.keymap.set("n", "<leader>ca", crates.update_all_crates, { buffer = bufnr })
					vim.keymap.set("n", "<leader>cU", crates.upgrade_crate, { buffer = bufnr })
					vim.keymap.set("v", "<leader>cU", crates.upgrade_crates, { buffer = bufnr })
					vim.keymap.set("n", "<leader>cA", crates.upgrade_all_crates, { buffer = bufnr })

					vim.keymap.set("n", "<leader>cx", crates.expand_plain_crate_to_inline_table, { buffer = bufnr })
					vim.keymap.set("n", "<leader>cX", crates.extract_crate_into_table, { buffer = bufnr })
				end,
				actions = true,
				completion = true,
				hover = true,
			},

			popup = {
				autofocus = true,
			},

			keys = {
				jump_forward = { "<c-]>" },
			},
		})
	end,
}
