-- leader
vim.g.mapleader = " "
vim.keymap.set({ "n", "x" }, "<Space>", "<Nop>")

-- Left-right motions
vim.keymap.set({ "n", "x" }, "n", "h")
vim.keymap.set({ "n", "x" }, "N", "^")

vim.keymap.set({ "n", "x" }, "i", "l")
vim.keymap.set({ "n", "x" }, "I", "$")

-- Up-down motions
vim.keymap.set({ "n", "x" }, "u", "k")
vim.keymap.set({ "n", "x" }, "U", "9k")

vim.keymap.set({ "n", "x" }, "e", "j")
vim.keymap.set({ "n", "x" }, "E", "9j")

-- Text object motions
vim.keymap.set({ "n", "x" }, "h", "e")
vim.keymap.set({ "n", "x" }, "H", "E")

-- Pattern searches
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "m", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
vim.keymap.set("x", "m", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
vim.keymap.set("n", "M", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
vim.keymap.set("x", "M", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Scrolling
vim.keymap.set({ "n", "x" }, "<C-u>", "9<C-y>")
vim.keymap.set({ "n", "x" }, "<C-e>", "9<C-e>")

-- Inserting text
vim.keymap.set({ "n", "x", "o" }, "k", "i")
vim.keymap.set("n", "K", "I")

-- Copying and moving text
vim.keymap.set("n", "YY", '"*yy')
vim.keymap.set("x", "Y", '"*y')

-- Changing text
vim.keymap.set("n", "<", "<<")
vim.keymap.set("n", ">", ">>")

-- Repeating commands
vim.keymap.set("n", "@", "Q")

-- Undo/Redo commands
vim.keymap.set("n", "l", "u")
vim.keymap.set("x", "l", "<CMD>undo<CR>")
vim.keymap.set("n", "L", "<C-r>")
vim.keymap.set("x", "L", "<CMD>redo<CR>")

-- Multi-window commands
vim.keymap.set({ "n", "x" }, "w", "<Nop>")
vim.keymap.set({ "n", "x" }, "wu", "<CMD>set nosplitbelow<CR><CMD>split<CR><CMD>set splitbelow<CR>")
vim.keymap.set({ "n", "x" }, "we", "<CMD>split<CR>")
vim.keymap.set({ "n", "x" }, "wn", "<CMD>set nosplitright<CR><CMD>vsplit<CR><CMD>set splitright<CR>")
vim.keymap.set({ "n", "x" }, "wi", "<CMD>vsplit<CR>")

vim.keymap.set({ "n", "x" }, "Q", "<CMD>q<CR>")

vim.keymap.set({ "n", "x" }, "wt", "<C-w><S-T>")

-- Buffer list commands
vim.keymap.set({ "n", "x" }, "[b", "<CMD>bprevious<CR>")
vim.keymap.set({ "n", "x" }, "]b", "<CMD>bnext<CR>")

-- Tabpage
vim.keymap.set({ "n", "x" }, "gt", "<CMD>tabnew<CR>")

vim.keymap.set({ "n", "x" }, "[t", "<CMD>tabprevious<CR>")
vim.keymap.set({ "n", "x" }, "]t", "<CMD>tabnext<CR>")

-- Jumps
vim.keymap.set({ "n", "x" }, "<C-k>", "<C-i>")

-- Duplicate line
vim.keymap.set("i", "<C-d>", "<Esc>yy$p$a")
vim.keymap.set("n", "<C-d>", "yy$p$")

-- Editing HOME/END
vim.keymap.set("n", "<C-n>", "I")
vim.keymap.set("i", "<C-n>", "<Esc>I")
vim.keymap.set("n", "<C-i>", "A")
vim.keymap.set("i", "<C-i>", "<Esc>A")

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG$")
vim.keymap.set("i", "<C-a>", "<Esc>ggVG$")

-- Increase/Decrease Number
vim.keymap.set("n", "<C-=>", "<C-a>")
vim.keymap.set("i", "<C-=>", "<Esc><C-a>a")
vim.keymap.set("n", "<C-->", "<C-x>")
vim.keymap.set("i", "<C-->", "<Esc><C-x>a")

-- Add blank line
vim.keymap.set("n", "<CR>", "o<Esc>")
vim.keymap.set("n", "<S-Enter>", "O<Esc>")

-- https://github.com/mhinz/vim-galore?tab=readme-ov-file#saner-ctrl-l
vim.keymap.set({ "n", "x" }, "<C-l>", "<CMD>nohlsearch<CR><CMD>diffupdate<CR><CMD>syntax sync fromstart<CR><C-l>")
