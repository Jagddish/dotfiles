local api = vim.api
-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- -- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})
-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"vim-fugitive",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

-- User command to compile & run C++ files
vim.api.nvim_create_user_command("RunCpp", function()
	local file = vim.fn.expand("%")   -- get current file
	if file == "" then
		print("No file open")
		return
	end
	if not file:match("%.cpp$") then
		print("Not a C++ file")
		return
	end

	-- Build executable name from file name
	local exe = vim.fn.expand("%:t:r")
	-- Compile and run
	local cmd = string.format("g++ -std=c++17 -Wall %s -o %s && ./%s", file, exe, exe)
	vim.cmd("split | terminal " .. cmd)
end, {})
vim.keymap.set("n", "<leader>r", ":RunCpp<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
      "n",
      "<leader>;",
      [[<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.expand("~/dotfiles/nvim/") })<CR>]],
      { noremap = true, silent = true }
    )

-- resize neovim split when terminal is resized
vim.api.nvim_command("autocmd VimResized * wincmd =")
