local colorschemes = {
	-- {
	-- 	"shaunsingh/nord.nvim",
	-- },
	-- {
	-- 	"neanias/everforest-nvim",
	-- 	name = "everforest",
	-- 	opts = { transparent_background_level = 2 },
	-- },
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	opts = { highlight_groups = { Visual = { bg = "#373267" } } },
	-- },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	opts = {
	-- 		transparent = true,
	-- 	},
	-- },
	{
		"rose-pine/neovim",
		enabled = true,
		priority = 1000,
		config = function()
			--vim.cmd([[colorscheme rose-pine-moon]])
		end,
	},
	{
		"Mofiqul/dracula.nvim",
		enabled = true,
		priority = 1000,
		config = function()
			-- vim.cmd([[colorscheme dracula]])
		end,
	},
	{
		"olimorris/onedarkpro.nvim",
		enabled = true,
		priority = 1000,
		config = function()
			-- vim.cmd([[colorscheme onedark]])
		end,
	},
}

for _, colorscheme in ipairs(colorschemes) do
	colorscheme.priority = 1000
	colorscheme.lazy = false
end

return colorschemes
