return {
	"saecki/crates.nvim",
	event = { "BufRead Cargo.toml" },

	config = function()
		require("crates").setup({
			autoupdate_throttle = 300,
			max_parallel_requests = 99,
			disable_invalid_feature_diagnostic = true,

			lsp = {
				enabled = true,

				---@diagnostic disable-next-line: unused-local
				on_attach = function(client, bufnr)
					-- the same on_attach function as for your other lsp's
					local crates = require("crates")

					vim.keymap.set("n", "<Leader>cr", crates.reload, { buffer = bufnr })

					-- vim.keymap.set("n", "<Leader>ci", crates.show_popup, { buffer = bufnr })
					vim.keymap.set("n", "<Leader>cv", crates.show_versions_popup, { buffer = bufnr })
					vim.keymap.set("n", "<Leader>cf", crates.show_features_popup, { buffer = bufnr })
					vim.keymap.set("n", "<Leader>cd", crates.show_dependencies_popup, { buffer = bufnr })

					vim.keymap.set("n", "<Leader>cu", crates.update_crate, { buffer = bufnr })
					vim.keymap.set("n", "<Leader>ca", crates.update_all_crates, { buffer = bufnr })
					vim.keymap.set("n", "<Leader>cU", crates.upgrade_crate, { buffer = bufnr })
					vim.keymap.set("n", "<Leader>cA", crates.upgrade_all_crates, { buffer = bufnr })

					vim.keymap.set("n", "<Leader>cx", crates.expand_plain_crate_to_inline_table, { buffer = bufnr })
					vim.keymap.set("n", "<Leader>cX", crates.extract_crate_into_table, { buffer = bufnr })
				end,
				actions = true,
				completion = true,
				hover = true,
			},

			popup = {
				autofocus = true,
				hide_on_select = true,
				border = "rounded",
				show_version_date = true,

				keys = {
					jump_forward = { "<c-]>" },
					jump_back = { "<c-t>" },
				},
			},
		})
	end,
}
