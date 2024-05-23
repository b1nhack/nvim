return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		{
			"benfowler/telescope-luasnip.nvim",
			dependencies = {
				"LuaSnip",
			},
		},
		{
			"nvim-telescope/telescope-dap.nvim",
		},
	},
	cmd = "Telescope",
	keys = {
		"<Leader>ff",
		"<Leader>fg",
		"<Leader>fb",
		"<Leader>fh",

		"<Leader>fl",
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local action_layout = require("telescope.actions.layout")

		local open_with_trouble = require("trouble.sources.telescope").open

		-- Use this to add more results without clearing the trouble list
		local add_to_trouble = require("trouble.sources.telescope").add

		local function flash(prompt_bufnr)
			require("flash").jump({
				pattern = "^",
				label = {
					style = "overlay",
					after = { 0, 0 },
				},
				search = {
					multi_window = true,
					mode = "search",
					exclude = {
						function(win)
							return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
						end,
					},
				},
				action = function(match)
					local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
					picker:set_selection(match.pos[1] - 1)
				end,
			})
		end

		telescope.setup({
			defaults = {
				scroll_strategy = "limit",
				layout_strategy = "flex",
				prompt_prefix = " ",
				selection_caret = " ",
				multi_icon = " ",
				dynamic_preview_title = true,
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
				},

				preview = {
					msg_bg_fillchar = "",
					filesize_limit = 1, -- MB
					mime_hook = function(filepath, bufnr, opts)
						local is_image = function(image_path)
							local image_extensions = { "png", "jpg", "gif", "svg", "ico", "jpeg", "bmp", "webp" }
							local split_path = vim.split(image_path:lower(), ".", { plain = true })
							local extension = split_path[#split_path]
							return vim.tbl_contains(image_extensions, extension)
						end
						if is_image(filepath) then
							local term = vim.api.nvim_open_term(bufnr, {})
							local function send_output(_, data, _)
								for _, d in ipairs(data) do
									vim.api.nvim_chan_send(term, d .. "\r\n")
								end
							end
							vim.fn.jobstart({
								"viu",
								filepath, -- Terminal image viewer command
							}, { on_stdout = send_output, stdout_buffered = true, pty = true })
						else
							require("telescope.previewers.utils").set_preview_message(
								bufnr,
								opts.winid,
								"Binary cannot be previewed"
							)
						end
					end,
				},

				-- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua#L133
				default_mappings = {
					i = {
						-- ["<LeftMouse>"] = {
						-- 	actions.mouse_click,
						-- 	type = "action",
						-- 	opts = { expr = true },
						-- },
						-- ["<2-LeftMouse>"] = {
						-- 	actions.double_mouse_click,
						-- 	type = "action",
						-- 	opts = { expr = true },
						-- },

						-- ["<C-n>"] = actions.move_selection_next,
						-- ["<C-p>"] = actions.move_selection_previous,

						["<C-c>"] = actions.close,

						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,

						["<CR>"] = actions.select_default,
						["<C-s>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						-- ["<C-t>"] = actions.select_tab,

						["<C-u>"] = actions.preview_scrolling_up,
						["<C-e>"] = actions.preview_scrolling_down,
						-- ["<C-f>"] = actions.preview_scrolling_left,
						-- ["<C-k>"] = actions.preview_scrolling_right,

						["<PageUp>"] = actions.results_scrolling_up,
						["<PageDown>"] = actions.results_scrolling_down,
						-- ["<M-f>"] = actions.results_scrolling_left,
						-- ["<M-k>"] = actions.results_scrolling_right,

						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<C-q>"] = add_to_trouble,
						-- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-l>"] = actions.complete_tag,
						["<C-/>"] = actions.which_key,
						["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
						["<C-w>"] = { "<c-s-w>", type = "command" },
						-- ["<C-r><C-w>"] = actions.insert_original_cword,

						-- disable c-j because we dont want to allow new lines #2123
						["<C-j>"] = actions.nop,
						["<C-p>"] = action_layout.toggle_preview,
						["<c-s>"] = flash,
						["<C-t>"] = open_with_trouble,
					},
					n = {
						-- ["<LeftMouse>"] = {
						-- 	actions.mouse_click,
						-- 	type = "action",
						-- 	opts = { expr = true },
						-- },
						-- ["<2-LeftMouse>"] = {
						-- 	actions.double_mouse_click,
						-- 	type = "action",
						-- 	opts = { expr = true },
						-- },

						["<esc>"] = actions.close,
						["<CR>"] = actions.select_default,
						["<C-s>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						-- ["<C-t>"] = actions.select_tab,

						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<C-q>"] = add_to_trouble,
						-- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

						["e"] = actions.move_selection_next,
						["u"] = actions.move_selection_previous,
						["U"] = actions.move_to_top,
						["M"] = actions.move_to_middle,
						["E"] = actions.move_to_bottom,

						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,
						["gg"] = actions.move_to_top,
						["G"] = actions.move_to_bottom,

						["<C-u>"] = actions.preview_scrolling_up,
						["<C-e>"] = actions.preview_scrolling_down,
						-- ["<C-f>"] = actions.preview_scrolling_left,
						-- ["<C-k>"] = actions.preview_scrolling_right,

						["<PageUp>"] = actions.results_scrolling_up,
						["<PageDown>"] = actions.results_scrolling_down,
						-- ["<M-f>"] = actions.results_scrolling_left,
						-- ["<M-k>"] = actions.results_scrolling_right,

						["?"] = actions.which_key,
						["<C-p>"] = action_layout.toggle_preview,
						["s"] = flash,
						["<C-t>"] = open_with_trouble,
					},
				},
			},

			pickers = {
				find_files = {
					previewer = false,
				},
				buffers = {
					mappings = {
						i = {
							["<c-d>"] = actions.delete_buffer + actions.move_to_top,
						},
						n = {
							["<c-d>"] = actions.delete_buffer + actions.move_to_top,
						},
					},
				},

				git_bcommits = {
					mappings = {
						i = {
							["<C-]>"] = actions.cycle_previewers_next,
							["<C-[>"] = actions.cycle_previewers_prev,
						},
						n = {
							["<C-]>"] = actions.cycle_previewers_next,
							["<C-[>"] = actions.cycle_previewers_prev,
						},
					},
				},

				git_commits = {
					mappings = {
						i = {
							["<C-]>"] = actions.cycle_previewers_next,
							["<C-[>"] = actions.cycle_previewers_prev,
						},
						n = {
							["<C-]>"] = actions.cycle_previewers_next,
							["<C-[>"] = actions.cycle_previewers_prev,
						},
					},
				},

				git_files = {
					previewer = false,
				},

				lsp_references = { initial_mode = "normal", reuse_win = true, theme = "ivy" },
				lsp_definitions = { initial_mode = "normal", reuse_win = true, theme = "ivy" },
				lsp_type_definitions = { initial_mode = "normal", reuse_win = true, theme = "ivy" },
				lsp_implementations = { initial_mode = "normal", reuse_win = true, theme = "ivy" },
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		})

		telescope.load_extension("noice")
		telescope.load_extension("fzf")
		telescope.load_extension("luasnip")
		telescope.load_extension("dap")

		local builtin = require("telescope.builtin")
		local func = require("telescope-function")

		vim.keymap.set("n", "<Leader>ff", func.project_files)
		vim.keymap.set("n", "<Leader>fg", func.live_grep_from_project_git_root)
		vim.keymap.set("n", "<Leader>fb", builtin.buffers)
		vim.keymap.set("n", "<Leader>fh", builtin.help_tags)

		vim.keymap.set("n", "<Leader>fl", builtin.resume)
	end,
}
