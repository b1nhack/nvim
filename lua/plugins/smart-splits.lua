return {
	"mrjones2014/smart-splits.nvim",
	build = "./kitty/install-kittens.bash",
	event = "VeryLazy",

	config = function()
		local splits = require("smart-splits")

		splits.setup({
			-- Ignored buffer types (only while resizing)
			ignored_buftypes = {
				"nofile",
				"quickfix",
				"prompt",
			},

			at_edge = "stop",
			-- when moving cursor between splits left or right,
			-- place the cursor on the same row of the *screen*
			-- regardless of line numbers. False by default.
			-- Can be overridden via function parameter, see Usage.
			move_cursor_same_row = true,
			-- resize mode options
			resize_mode = {
				-- keys to use for moving in resize mode
				-- in order of left, down, up' right
				resize_keys = { "u", "e", "n", "i" },
			},
			-- disable multiplexer navigation if current multiplexer pane is zoomed
			-- this functionality is only supported on tmux and Wezterm due to kitty
			-- not having a way to check if a pane is zoomed
			disable_multiplexer_nav_when_zoomed = false,
			-- Supply a Kitty remote control password if needed,
			-- or you can also set vim.g.smart_splits_kitty_password
			-- see https://sw.kovidgoyal.net/kitty/conf/#opt-kitty.remote_control_password
			kitty_password = nil,
			-- default logging level, one of: 'trace'|'debug'|'info'|'warn'|'error'|'fatal'
			log_level = "error",
		})

		-- recommended mappings
		-- resizing splits
		-- these keymaps will also accept a range,
		-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
		vim.keymap.set("n", "<S-Up>", splits.resize_up)
		vim.keymap.set("n", "<S-Down>", splits.resize_down)
		vim.keymap.set("n", "<S-Left>", splits.resize_left)
		vim.keymap.set("n", "<S-Right>", splits.resize_right)
		-- moving between splits
		vim.keymap.set("n", "<M-u>", splits.move_cursor_up)
		vim.keymap.set("n", "<M-e>", splits.move_cursor_down)
		vim.keymap.set("n", "<M-n>", splits.move_cursor_left)
		vim.keymap.set("n", "<M-i>", splits.move_cursor_right)
		-- swapping buffers between windows
		vim.keymap.set("n", "<M-S-u>", splits.swap_buf_up)
		vim.keymap.set("n", "<M-S-e>", splits.swap_buf_down)
		vim.keymap.set("n", "<M-S-n>", splits.swap_buf_left)
		vim.keymap.set("n", "<M-S-i>", splits.swap_buf_right)
	end,
}
