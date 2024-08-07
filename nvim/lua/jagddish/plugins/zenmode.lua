return {
	"folke/zen-mode.nvim",
	enabled = true,
	config = function()
		vim.keymap.set("n", "<leader>zZ", function()
			require("zen-mode").setup({
				window = {
					width = 90,
					options = {},
				},
				plugins = {
					tmux = { enabled = false },
				},
			})
			require("zen-mode").toggle()
			vim.wo.wrap = false
			vim.wo.number = true
			vim.wo.rnu = true
		end)

		vim.keymap.set("n", "<leader>zz", function()
			require("zen-mode").setup({
				window = {
					width = 70,
					height = 0.80,

					options = {},
				},
			})
			require("zen-mode").toggle()
			vim.wo.wrap = false
			vim.wo.number = false
			vim.wo.rnu = false
			vim.opt.colorcolumn = "0"
		end)
	end,
}
