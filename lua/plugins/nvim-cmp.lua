return {
	"hrsh7th/nvim-cmp",

	dependencies = {
		"cmp-nvim-lsp",
		"LuaSnip",
		"cmp_luasnip",
		"cmp-buffer",
		"cmp-cmdline",
		"cmp-path",
	},
	event = { "InsertEnter", "CmdlineEnter" },

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		local kind_icons = {
			Text = "",
			Method = "󰆧",
			Function = "󰊕",
			Constructor = "",
			Field = "󰇽",
			Variable = "󰂡",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "󰅲",
		}

		cmp.setup({
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
			}, {
				{ name = "path" },
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
			},

			view = {
				entries = { name = "custom", selection_order = "near_cursor" },
			},

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
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
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
