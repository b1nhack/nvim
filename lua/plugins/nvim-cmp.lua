return {
	"hrsh7th/nvim-cmp",

	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		{
			name = "cmp-async-path",
			url = "https://codeberg.org/FelipeLema/cmp-async-path",
		},
	},
	event = { "InsertEnter", "CmdlineEnter" },

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		local kind_icons = {
			Text = "󰦨 ",
			Method = " ",
			Function = "󰡱 ",
			Constructor = " ",
			Field = " ",
			Variable = " ",
			Class = " ",
			Interface = " ",
			Module = "󰰏 ",
			Property = " ",
			Unit = "󰰧 ",
			Value = " ",
			Enum = " ",
			Keyword = " ",
			Snippet = " ",
			Color = " ",
			File = " ",
			Reference = " ",
			Folder = " ",
			EnumMember = " ",
			Constant = " ",
			Struct = " ",
			Event = " ",
			Operator = " ",
			TypeParameter = " ",
		}

		cmp.setup({
			sources = cmp.config.sources({
				{ name = "async_path" },
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
			}, {
				{
					name = "buffer",
					option = {
						-- https://github.com/hrsh7th/cmp-buffer?tab=readme-ov-file#performance-on-large-text-files
						get_bufnrs = function()
							local buf = vim.api.nvim_get_current_buf()
							local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
							if byte_size > 1024 * 1024 then -- 1 Megabyte max
								return {}
							end
							return { buf }
						end,
					},
				},
			}),

			mapping = {
				["<C-u>"] = cmp.mapping.scroll_docs(-5), -- Up
				["<C-e>"] = cmp.mapping.scroll_docs(5), -- Down

				["<CR>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						if luasnip.expandable() then
							luasnip.expand()
						else
							cmp.confirm({
								select = true,
							})
						end
					else
						fallback()
					end
				end),

				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			},

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			completion = {
				completeopt = vim.o.completeopt,
				keyword_length = 2,
			},

			window = {
				completion = {
					border = "rounded",
				},
				documentation = {
					border = "rounded",
				},
			},

			view = {
				entries = { name = "custom", selection_order = "near_cursor" },
			},

			---@diagnostic disable-next-line: missing-fields
			formatting = {
				format = function(entry, vim_item)
					-- Kind icons
					vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
					-- Source
					vim_item.menu = ({
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						luasnip = "[Snip]",
						path = "[Path]",
						cmdline = "[Cmdline]",
					})[entry.source.name]
					return vim_item
				end,
			},

			-- https://github.com/hrsh7th/nvim-cmp/pull/676#issuecomment-1002532096
			enabled = function()
				if
					require("cmp.config.context").in_treesitter_capture("comment") == true
					or require("cmp.config.context").in_syntax_group("Comment")
				then
					return false
				else
					return true
				end
			end,
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "async_path" },
			}, {
				{ name = "cmdline" },
			}),
			---@diagnostic disable-next-line: missing-fields
			matching = { disallow_symbol_nonprefix_matching = false },

			-- https://github.com/hrsh7th/nvim-cmp/wiki/Advanced-techniques#disabling-cmdline-completion-for-certain-commands-such-as-increname
			enabled = function()
				-- Set of commands where cmp will be disabled
				local disabled = {
					IncRename = true,
				}
				-- Get first word of cmdline
				local cmd = vim.fn.getcmdline():match("%S+")
				-- Return true if cmd isn't disabled
				-- else call/return cmp.close(), which returns false
				return not disabled[cmd] or cmp.close()
			end,
		})
	end,
}
