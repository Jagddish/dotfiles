-- leader
vim.cmd([[ highlight Pmenu guibg=#000 ]])
vim.g.mapleader = " " -- change leader to a space
-- Set syntastic_auto_jump to 0
vim.g.syntastic_auto_jump = 0
vim.g.loaded_netrw = 1 -- disable netrw
vim.g.loaded_netrwPlugin = 1 --  disable netrw
vim.g.colorcolumn = 80
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.showmode = true -- we don't need to see things like -- INSERT -- anymore
vim.opt.incsearch = true -- make search act like search in modern browsers
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.scrolloff = 8 -- Makes sure there are always eight lines of context
vim.opt.sidescrolloff = 8 -- Makes sure there are always eight lines of context
vim.opt.cursorline = false -- highlight the current line
vim.opt.wrap = false -- display lines as one long line
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.updatetime = 100 -- faster completion (4000ms default)
vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
-- vim.opt.background = "dark" -- colorschemes that can be light or dark will be made dark
vim.opt.swapfile = false -- creates a swapfile
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.backup = false -- creates a backup file
-- vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
-- vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- mostly just for cmp
-- vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.undofile = true -- enable persistent undo
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.laststatus = 0 -- Always display the status line
vim.opt.fillchars = { eob = " " } -- change the character at the end of buffer

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.isfname:append("@-@")
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.fillchars = vim.opt.fillchars + { vert = " " } -- remove line between splits
vim.cmd("autocmd VimResized * wincmd =")
