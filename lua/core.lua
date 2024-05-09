-- list of directories for the backup file
vim.o.backupdir = vim.fn.expand("~/.cache/nvim/backup")

-- highlight the screen line of the cursor
vim.o.cursorline = true

-- list of directory names for the swap file
vim.o.directory = vim.fn.expand("~/.cache/nvim/swap")

-- hig-- file format used for file I/O
vim.o.fileformat = "unix"

-- program to use for ":grep"
vim.o.grepprg = "rg -n $* /dev/null"

-- ignore case in search patterns
vim.o.ignorecase = true

-- adjust case of match for keyword completion
vim.o.infercase = true

-- enable the use of mouse clicks
vim.o.mouse = ""

-- print the line number in front of each line
vim.o.number = true

-- maximum number of items to show in the popup menu
vim.o.pumheight = 15

-- show relative line number in front of each line
vim.o.relativenumber = true

-- show cursor line and column in the status line
vim.o.ruler = false

-- minimum nr. of lines above and below cursor
vim.o.scrolloff = 5

-- number of spaces to use for (auto)indent step
vim.o.shiftwidth = 2

-- show (partial) command somewhere
vim.o.showcmd = false

-- message on status line to show current mode
vim.o.showmode = false

-- min. nr. of columns to left and right of cursor
vim.o.sidescrolloff = 5

-- when and how to display the sign column
-- "yes"	always
vim.o.signcolumn = "yes"

-- no ignore case when pattern has uppercase
vim.o.smartcase = true

-- smart autoindenting for C programs
vim.o.smartindent = true

-- scroll by screen lines when "wrap" is set
vim.o.smoothscroll = true

-- whether to use a swapfile for a buffer
vim.o.swapfile = false

-- number of spaces that <Tab> in file uses
vim.o.tabstop = 2

-- Nvim emits true (24-bit) colours in the terminal
vim.o.termguicolors = true

-- where to store undo files
vim.o.undodir = vim.fn.expand("~/.cache/nvim/undo")

-- save undo information in a file
vim.o.undofile = true

-- directory where to store files with :mkview
vim.o.viewdir = vim.fn.expand("~/.cache/nvim/view")

-- when to use virtual editing

-- block	Allow virtual editing in Visual block mode.
-- insert	Allow virtual editing in Insert mode.
-- all		Allow virtual editing in all modes.
-- onemore	Allow the cursor to move just past the end of the line
-- none	When used as the local value, do not allow virtual
-- editing even when the global value is set.  When used
-- as the global value, "none" is the same as "".
-- NONE	Alternative spelling of "none".
vim.o.virtualedit = "block"

-- ignore case when completing file names
vim.o.wildignorecase = true

-- long lines wrap and continue on the next line
vim.o.wrap = false

-- options for Insert mode completion
vim.o.completeopt = "menu,menuone,noselect,noinsert,popup"

-- new window from split is below the current one
vim.o.splitbelow = true

-- new window is put right of the current one
vim.o.splitright = true

-- time out time in milliseconds
vim.o.timeoutlen = 300

-- set to display all folds open
vim.o.foldenable = false

-- folding type
vim.o.foldmethod = "expr"

-- expression used when "foldmethod" is "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- list of flags, reduce length of messages
vim.o.shortmess = "tToOCFI"

vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
