-- Refactoring tool
return {
	"ThePrimeagen/refactoring.nvim",
	enabled = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{
			"<leader>r",
			function()
				require("refactoring").select_refactor()
			end,
			mode = "v",
			noremap = true,
			silent = true,
			expr = false,
		},
	},
	opts = {},
}
