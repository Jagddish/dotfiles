-- ============================================
-- Leader Key
-- ============================================
vim.g.mapleader = " " -- Use space as the leader key

-- ============================================
-- Highlight & UI Tweaks
-- ============================================
vim.cmd([[ highlight Pmenu guibg=#000 ]]) -- Set popup menu background color
vim.opt.termguicolors = true              -- Enable true color support
vim.opt.colorcolumn = "80"                -- Show vertical line at column 80
vim.opt.cursorline = false                -- Highlight current line
vim.opt.number = true                     -- Show line numbers
vim.opt.relativenumber = true             -- Show relative numbers
vim.opt.signcolumn = "yes"                -- Always show sign column
vim.opt.laststatus = 0                    -- Hide status line
vim.opt.fillchars = { eob = " " }         -- Hide ~ at end of buffer
vim.opt.fillchars = vim.opt.fillchars + { vert = " " } -- Remove vertical split lines

-- ============================================
-- Indentation & Tabs
-- ============================================
vim.opt.shiftwidth = 2   -- Spaces per indentation
vim.opt.tabstop = 2      -- Spaces per tab
vim.opt.softtabstop = 2  -- Insert spaces when hitting <Tab>
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true -- Smarter indentation

-- ============================================
-- Search
-- ============================================
vim.opt.incsearch = true -- Incremental search
vim.opt.hlsearch = true  -- Highlight search results
vim.opt.ignorecase = true -- Case insensitive search…
vim.opt.smartcase = true  -- …unless search contains uppercase

-- ============================================
-- Splits & Windows
-- ============================================
vim.opt.splitbelow = true -- Horizontal splits open below
vim.opt.splitright = true -- Vertical splits open right
vim.cmd("autocmd VimResized * wincmd =") -- Auto-resize windows equally

-- ============================================
-- Files, Undo & Backups
-- ============================================
vim.opt.swapfile = false  -- Disable swapfile
vim.opt.backup = false    -- Disable backup
vim.opt.undofile = true   -- Persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- ============================================
-- Performance & Timings
-- ============================================
vim.opt.updatetime = 100   -- Faster completion (default 4000ms)
vim.opt.timeoutlen = 1000  -- Timeout for mapped sequences

-- ============================================
-- Quality of Life
-- ============================================
vim.opt.mouse = "a"         -- Enable mouse support
vim.opt.scrolloff = 8       -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8   -- Keep 8 columns left/right
vim.opt.wrap = false        -- Don't wrap long lines
vim.opt.showmode = true     -- Show mode like -- INSERT --
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- For nvim-cmp

-- ============================================
-- Plugins & External Tools
-- ============================================
vim.g.syntastic_auto_jump = 0   -- Prevent Syntastic from auto-jumping to first error
vim.g.loaded_netrw = 1          -- Disable netrw (use oil.nvim, nvim-tree, etc.)
vim.g.loaded_netrwPlugin = 1    -- Disable netrw plugin
vim.opt.isfname:append("@-@")   -- Allow '@' in filenames
vim.opt.wildignore:append({ "*/node_modules/*" }) -- Ignore node_modules in wildmenu

-- ============================================
-- Optional Settings (Uncomment if needed)
-- ============================================
-- vim.opt.background = "dark" -- Force dark theme
-- vim.opt.clipboard = "unnamedplus" -- Use system clipboard
-- vim.opt.clipboard:append("unnamedplus") -- Alternative for system clipboard
-- vim.opt.fileencoding = "utf-8" -- Set default file encoding