return {
	"knubie/vim-kitty-navigator",
	build = "cp ./*.py ~/.config/kitty/",
	event = "VeryLazy",

	init = function()
		vim.g.kitty_navigator_no_mappings = 1
		vim.keymap.set({ "n", "x" }, "<M-u>", "<CMD>KittyNavigateUp<CR>")
		vim.keymap.set({ "n", "x" }, "<M-e>", "<CMD>KittyNavigateDown<CR>")
		vim.keymap.set({ "n", "x" }, "<M-n>", "<CMD>KittyNavigateLeft<CR>")
		vim.keymap.set({ "n", "x" }, "<M-i>", "<CMD>KittyNavigateRight<CR>")
	end,
}
