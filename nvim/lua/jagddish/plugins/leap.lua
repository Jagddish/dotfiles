return {
	"ggandor/leap.nvim",
	-- event = "BufReadPre",
	dependencies = { "tpope/vim-repeat" },
	config = function()
		require("leap").setup({
			-- require("leap").create_default_mappings()
			-- require("leap").add_default_mappings()
			vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)"),
			vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)"),
			vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)"),
		})
	end,
}
