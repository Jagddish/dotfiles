local wk = require("which-key")
-- change leader to a space
vim.g.mapleader = " "

---------------------------------------------------------------------------
--													Insert Mode
---------------------------------------------------------------------------

vim.keymap.set("i", "kk", "<Esc>", { noremap = true })
vim.keymap.set("i", "<c-c>", "<Esc>|:update<CR>", { noremap = true })
vim.keymap.set("i", "jj", "<Esc>|:update<CR>", { noremap = true })
-- insert newline below
vim.keymap.set("i", "<C-f>", "<ESC>o", { noremap = true, silent = true })
-- goto end of the line
vim.keymap.set("i", "<C-e>", "<ESC>A", { noremap = true, silent = true })

---------------------------------------------------------------------------
--													Normal Mode
---------------------------------------------------------------------------
vim.keymap.set("n", "<leader><cr>", ":update<CR>", { noremap = true })
vim.keymap.set("n", "<C-q>", ":q!<CR>", { silent = true, noremap = true })
-- vim.keymap.set("n", "<c-m>", ":!node %<CR>", { silent = true, noremap = true })

--  buffer
vim.keymap.set("n", "<leader>q", ":bd<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>j", ":bprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>l", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", "<cmd>bp|bd #<CR>", { desc = "Close Buffer; Retain Split" })
vim.keymap.set(
	"n",
	"<leader>bo",
	"<cmd>w <bar> %bd <bar> e# <bar> bd#<CR>",
	{ desc = "Close all buffers except current one" }
)

-- select all
vim.keymap.set("n", "==", "gg<S-v>G")

-- add empty line
vim.api.nvim_set_keymap("n", "<C-w>", "o<Esc>", { noremap = true, silent = true })

-- clear search results
vim.keymap.set("n", "<c-c>", "<cmd>nohlsearch<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { noremap = true, silent = true })

-- navigate splits in vim
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sl", "<C-w>l")
--Lazygit
vim.keymap.set("n", "<c-e>", "<cmd>LazyGit<CR>", { noremap = true, silent = true })

-- refactoring
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- resize splits
vim.keymap.set("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Resize split up" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Resize split down" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize split left" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize split right" })

-- move lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "(V) Indent to left" })
vim.keymap.set("v", ">", ">gv", { desc = "(V) Indent to right" })

--Splits
vim.keymap.set("", "<leader>vv", "<C-w>v", { noremap = true })
vim.keymap.set("", "<leader>hh", "<C-w>s", { noremap = true })
-- Change 2 splits windows from vert to horiz
vim.keymap.set("", "<leader>vs", "<C-w>t<C-w>H", { noremap = true })
vim.keymap.set("", "<leader>hs", "<C-w>t<C-w>K", { noremap = true })

-- Create a key mapping for 'x' to delete a character without storing it in any register
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true, desc = "Delete Character" })
vim.keymap.set("x", "<leader>p", [["_dP]])

wk.register({
	["[<leader>"] = {
		function()
			local curr_line = vim.api.nvim_win_get_cursor(0)[1]
			local prev_line = curr_line - 1
			vim.api.nvim_buf_set_lines(0, prev_line, prev_line, true, { "" })
			vim.api.nvim_input("<up>")
		end,
		"Add line above",
	},
	["]<leader>"] = {
		function()
			local curr_line = vim.api.nvim_win_get_cursor(0)[1]
			vim.api.nvim_buf_set_lines(0, curr_line, curr_line, true, { "" })
			vim.api.nvim_input("<down>")
		end,
		"Add line below",
	},

	["0"] = { "^", "Go to first character of line" },
	["^"] = { "0", "Go to start of line" },
})
-- vim.keymap.set(
-- 	"n",
-- 	"<leader>ns",
-- 	":!tmux split-window -v; tmux send-keys -t 2 'node %' Enter<CR><CR>",
-- 	{ silent = true, noremap = true }
-- )
-- vim.keymap.set(
-- 	"n",
-- 	"<leader>nv",
-- 	":!tmux split-window -v; tmux send-keys -t 2 '%' Enter <CR><CR>",
-- 	{ silent = true, noremap = true }
-- )

-- vim.keymap.set("n", "<leader>nv", ":!tmux split-window -h<CR><CR>", { silent = true, noremap = true })

--utility vim.keymap.setpings

-- search related
-- vim.keymap.set("n", "cn", "*``cgn", { desc = "Change next match by pressing dot (.)" })
-- vim.keymap.set("n", "cN", "*``cgN", { desc = "Change previous match by pressing dot (.)" })
-- vim.keymap.set("n", "<leader>vp", "`[v`]<CR>", { desc = "Select pasted text" })
-- vim.keymap.set(
-- 	"n",
-- 	"<leader>z",
-- 	":%s/<C-R><C-W>/<C-R>0/g<CR>",
-- 	{ desc = 'Replace word under cursor with register "0" content globally' }
-- )

-- vim.keymap.set("n", "<leader>ts", "<cmd>set spell!<CR>", { desc = "Toggle spell check" })
-- vim.keymap.set("n", "<leader>th", "<cmd>set hlsearch!<CR>", { desc = "Toggle highlights (hlsearch)" })
-- vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
-- vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
-- vim.keymap.set({ "i" }, "<C-l>", "<Right>", { desc = "Move cursor to right" })
-- vim.keymap.set({ "i" }, "<C-h>", "<Left>", { desc = "Move cursor to right" })

--

-- Visual {{{
