local wk = require("which-key")

wk.register({
	-- ["<c-s>"] = { "<cmd>:w<cr>", "Save the file" },
	-- ["<c-v>"] = { "<esc>pa", "Paste" },
	-- ["<a-a>"] = { "<esc>I", "(Insert) Jump to line start" },
	-- ["<a-l>"] = { "<esc>A", "(Insert) Jump to line end" },
	-- ["<a-h>"] = { "<esc>O", "Insert new line below" },
	-- ["<a-k>"] = { "<esc>ddi", "Delete current line" },
	["<a-y>"] = {
		function()
			local buffer = vim.api.nvim_get_current_buf()
			local cursor = vim.api.nvim_win_get_cursor(0)
			local curr_line = vim.api.nvim_get_current_line()
			vim.api.nvim_buf_set_lines(buffer, cursor[1], cursor[1], true, { curr_line })
			vim.api.nvim_win_set_cursor(0, { cursor[1] + 1, cursor[2] })
		end,
		"Duplicate current line",
	},
}, {
	mode = "i",
})
