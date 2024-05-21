vim.o.mouse = ""

vim.o.timeoutlen = 299

vim.o.backupdir = vim.fn.expand("~/.cache/nvim/backup")
vim.o.directory = vim.fn.expand("~/.cache/nvim/swap")
vim.o.undodir = vim.fn.expand("~/.cache/nvim/undo")
vim.o.viewdir = vim.fn.expand("~/.cache/nvim/view")

vim.o.swapfile = false
vim.o.undofile = true

vim.o.ignorecase = true
vim.o.infercase = true
vim.o.smartcase = true
vim.o.wildignorecase = true

-- ui
vim.o.colorcolumn = "80"
vim.o.cursorline = true
vim.o.display = "lastline,uhex"
vim.o.listchars = "tab:󰌒 "
vim.o.number = true
vim.o.relativenumber = true
vim.o.ruler = false
vim.o.showcmd = false
vim.o.showmode = false
vim.o.signcolumn = "yes"
vim.o.termguicolors = true

-- behavior
vim.o.fileformat = "unix"
vim.o.fileignorecase = false
vim.o.history = 9999
vim.o.jumpoptions = "stack"
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.o.shada = ""
vim.o.shortmess = "tToOCFI"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.virtualedit = "block"
vim.o.wrapscan = false

vim.o.cindent = true
vim.o.copyindent = true
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.tabstop = 4

vim.o.completeopt = "menu,menuone,noselect,noinsert,popup"
vim.o.pumheight = 15
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5
vim.o.wrap = false

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
