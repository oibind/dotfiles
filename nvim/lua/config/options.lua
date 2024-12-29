local opt = vim.opt


-- Basic config
opt.shell = "dash"

opt.termguicolors = true
opt.signcolumn = "yes"

opt.encoding = "UTF-8"

opt.autoread = true

opt.title = true
opt.number = true
opt.relativenumber = true
opt.ttyfast = true

opt.expandtab = true
opt.smarttab = true
opt.smartindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.wrap = true

-- Toggle invisible characters
opt.list = true
opt.listchars = "tab:›—,trail:␣,extends:▶,precedes:◀"

-- Disable automatic commenting on a new line
vim.cmd([[
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]])

-- make backspace act in a sane manner
opt.backspace = "indent,eol,start"

opt.clipboard = "unnamedplus"

opt.swapfile = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

vim.cmd([[
au FileType markdown,text setlocal spell textwidth=0 linebreak
au FileType gitcommit setlocal colorcolumn+=51
]])
