vim.o.mouse = ''
vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.c_syntax_for_h = 1

vim.o.timeoutlen = 300

vim.o.backupdir = vim.fn.stdpath('cache') .. '/backup'
vim.o.directory = vim.fn.stdpath('cache') .. '/swap'
vim.o.undodir = vim.fn.stdpath('cache') .. '/undo'
vim.o.viewdir = vim.fn.stdpath('cache') .. '/view'

vim.o.undofile = true
vim.o.undolevels = 99
vim.o.undoreload = 99

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.infercase = true
vim.o.wildignorecase = true

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldtext = ''
vim.o.foldcolumn = '0'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

-- ui
vim.o.colorcolumn = '+1'
vim.o.cursorline = true
vim.o.listchars = table.concat({ 'extends:', 'nbsp:󱁐', 'tab:󰌒 ' }, ',')
vim.o.number = true
vim.o.relativenumber = true
vim.o.ruler = false
vim.o.showcmd = false
vim.o.showmode = false
vim.o.cmdheight = 0
vim.o.signcolumn = 'yes'
vim.o.termguicolors = true
vim.o.wildmenu = false
vim.o.wildchar = 0
vim.o.fillchars = table.concat({
  'horiz:═',
  'horizup:╩',
  'horizdown:╦',
  'vert:║',
  'vertleft:╣',
  'vertright:╠',
  'verthoriz:╬',

  'fold: ',
  'diff: ',
}, ',')

-- behavior
vim.o.fileformat = 'unix'
vim.o.history = 99
vim.o.jumpoptions = 'stack,view'
vim.o.sessionoptions =
  'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
vim.o.shada = "'99,<50,h,s10"
vim.o.shortmess = 'tToOCFcsI'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.virtualedit = 'block'
vim.o.wrapscan = false
vim.o.switchbuf = 'useopen'
vim.o.breakindent = true
vim.o.splitkeep = 'screen'
vim.opt.iskeyword:append('-')
vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]
vim.o.formatoptions = 'rqnl1j'

vim.o.cindent = true
vim.o.copyindent = true
vim.o.smartindent = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

vim.o.completeopt = 'menu,menuone,noselect,noinsert,popup'
vim.o.pumheight = 15
vim.o.wrap = false

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

local augroup = vim.api.nvim_create_augroup('CustomSettings', {})
vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  callback = function()
    -- Don't auto-wrap comments and don't insert comment leader after hitting 'o'
    -- If don't do this on `FileType`, this keeps reappearing due to being set in
    -- filetype plugins.
    vim.cmd('setlocal formatoptions-=c formatoptions-=o')
  end,
  desc = [[Ensure proper 'formatoptions']],
})
