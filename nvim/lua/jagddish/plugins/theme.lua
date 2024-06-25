return {
	{
		"rose-pine/neovim",
		enabled = true,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme rose-pine-moon]])
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
	-- {
	-- 	"navarasu/onedark.nvim",
	-- 	enabled = true,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme onedark]])
	-- 	end,
	-- },

	{
		"xiyaowong/transparent.nvim",
		enable = true,
		config = function()
			require("transparent").clear_prefix("BufferLine")
			require("transparent").clear_prefix("Normal")
			require("transparent").clear_prefix("Navic")
			require("transparent").clear_prefix("Mason")
			require("transparent").clear_prefix("Lazy")
			require("transparent").clear_prefix("PMenu")
			require("transparent").clear_prefix("Float")
			-- require("transparent").clear_prefix("NeoTree")
			require("transparent").clear_prefix("Noice")
			require("transparent").clear_prefix("NvimTree")
			require("transparent").clear_prefix("Telescope")
			require("transparent").clear_prefix("Notify")
			require("transparent").clear_prefix("GitSigns")
			require("transparent").clear_prefix("Satellite")
			require("transparent").clear_prefix("which-key")
			require("transparent").clear_prefix("lualine")
			require("transparent").clear_prefix("Trouble")
			require("transparent").clear_prefix("BufferLine")
			require("transparent").clear_prefix("barbecue")
			require("transparent").clear_prefix("Mini")

			require("transparent").setup({ -- Optional, you don't have to run setup.

				-- added colorscheme as dependencies so colorscheme loads first
				-- vim.cmd([[colorscheme rose-pine-moon]]),

				groups = { -- table: default groups
					"Comment",
					"Constant",
					"Special",
					"Identifier",
					"Statement",
					"PreProc",
					"Type",
					"Underlined",
					"Todo",
					"String",
					"Function",
					"Conditional",
					"Repeat",
					"Operator",
					"Structure",
					"LineNr",
					"NonText",
					"SignColumn",
					"CursorLineNr",
					"StatusLine",
					"StatusLineNC",
					"EndOfBuffer",
					"SignColumn",
				},
				extra_groups = {
					"OctoEditable",
					"NvimTreeNormal", -- NvimTree
					"EndOfBuffer",
					-- "Search",
					"Cursor",
					"WinbarNormal",
					"WinbarNormalNC",
					"NavicIcons",
					"NavicIconsFile",
					"WinSeparator",
					"NavicIconsModule",
					"NavicText",
					"NavicSeparator",
					"LazyNormal",
				}, -- table: additional groups that should be cleared
				exclude_groups = {
					"CursorLine",
				}, -- table: groups you don't want to clear
			})
			require("transparent").clear_prefix("lualine")
		end,
	},

	{
		"NvChad/nvim-colorizer.lua",
		enabled = true,
		config = function()
			require("colorizer").setup({})
		end,
	},
}
