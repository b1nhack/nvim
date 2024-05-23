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
		{
			"petertriho/cmp-git",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},

			config = function()
				require("cmp_git").setup()
			end,
		},
	},
	event = { "InsertEnter", "CmdlineEnter" },

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local icons = require("global").icons

		local other_mapping = {
			["<C-u>"] = {
				c = function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end,
			},
			["<C-e>"] = {
				c = function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						fallback()
					end
				end,
			},
			["<C-k>"] = {
				c = function(fallback)
					if cmp.visible() then
						cmp.abort()
					else
						fallback()
					end
				end,
			},
		}

		local kind_icons = {
			Class = icons.Class,
			Color = icons.Color,
			Constant = icons.Constant,
			Constructor = icons.Constructor,
			Enum = icons.Enum,
			EnumMember = icons.EnumMember,
			Event = icons.Event,
			Feature = icons.Feature,
			Field = icons.Field,
			File = icons.File,
			Folder = icons.Folder,
			Function = icons.Function,
			Interface = icons.Interface,
			Keyword = icons.Keyword,
			Method = icons.Method,
			Module = icons.Module,
			Operator = icons.Operator,
			Property = icons.Property,
			Reference = icons.Reference,
			Snippet = icons.Snippet,
			Struct = icons.Struct,
			Text = icons.Text,
			TypeParameter = icons.TypeParameter,
			Unit = icons.Unit,
			Value = icons.Value,
			Variable = icons.Variable,
			Version = icons.Version,
		}

		cmp.setup({
			preselect = cmp.PreselectMode.None,

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
				["<C-u>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end),
				["<C-e>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						fallback()
					end
				end),

				["<C-h>"] = cmp.mapping(function(fallback)
					if cmp.visible_docs() then
						cmp.scroll_docs(-5)
					else
						fallback()
					end
				end),
				["<C-b>"] = cmp.mapping(function(fallback)
					if cmp.visible_docs() then
						cmp.scroll_docs(5)
					else
						fallback()
					end
				end),

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
				["<S-CR>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						if luasnip.expandable() then
							luasnip.expand()
						else
							cmp.confirm({
								select = true,
								behavior = cmp.ConfirmBehavior.Replace,
							})
						end
					else
						fallback()
					end
				end),

				["<Tab>"] = cmp.mapping(function(fallback)
					if luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<C-k>"] = function(fallback)
					if cmp.visible() then
						cmp.abort()
					else
						fallback()
					end
				end,
			},

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			completion = {
				completeopt = vim.o.completeopt,
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

		-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
		-- Set configuration for specific filetype.
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "git" },
			}, {
				{ name = "buffer" },
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = other_mapping,
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = other_mapping,
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
