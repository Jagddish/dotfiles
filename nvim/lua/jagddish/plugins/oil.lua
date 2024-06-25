-- file explorer lets you create files and folder in the vim
-- keymap and type the file or folder name
return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			prompt_save_on_select_new_entry = false,
			use_default_keymaps = false,
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
			keymaps = {
				["<leader>wv"] = {
					"actions.select",
					opts = { vertical = true },
					desc = "Open the entry in a vertical split",
				},
				["<leader>wh"] = {
					"actions.select",
					opts = { horizontal = true },
					desc = "Open the entry in a horizontal split",
				},
				["<C-c>"] = "actions.close",
				["<CR>"] = "actions.select",
			},
		})
	end,
}
