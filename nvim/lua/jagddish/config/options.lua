-- leader
vim.g.mapleader = " "
vim.opt.shortmess:append("c")
-- numbercolumn
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs & indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.smartindent = true
vim.opt.smartcase = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.termguicolors = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- turn off swapfile
vim.opt.swapfile = false
vim.opt.isfname:append("@-@")
vim.opt.wildignore:append({ "*/node_modules/*" })

-- remove line between splits
vim.opt.fillchars = vim.opt.fillchars + { vert = " " }

vim.cmd("autocmd VimResized * wincmd =")
