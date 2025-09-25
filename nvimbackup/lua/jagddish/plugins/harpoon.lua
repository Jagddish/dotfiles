return {
	"ThePrimeagen/harpoon",
	enabled = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set(
			"n",
			"<leader>a",
			"<cmd>lua require('harpoon.mark').add_file()<cr>",
			{ desc = "Mark file with harpoon" }
		)
		keymap.set(
			"n",
			"<leader>e",
			"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
			{ desc = "Toggle harpoon menu" }
		)
		keymap.set("n", "<C-l>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Go to next harpoon mark" })
		keymap.set(
			"n",
			"<C-s>",
			"<cmd>lua require('harpoon.ui').nav_prev()<cr>",
			{ desc = "Go to previous harpoon mark" }
		)
	end,
}
