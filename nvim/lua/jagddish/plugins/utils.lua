return {
	{
		"tpope/vim-sleuth",
	},

	{
		"christoomey/vim-tmux-navigator",
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},
	{
		"vhyrro/luarocks.nvim",
		priority = 1001, -- this plugin needs to run before anything else
		opts = {
			rocks = { "magick" },
		},
	},
}
