return {
	{
		"scottmckendry/cyberdream.nvim",
		priority = 1000,
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = true,
		config = function()
			-- vim.cmd("colorscheme kanagawa-wave")
			-- vim.cmd("colorscheme kanagawa-dragon")
			-- vim.cmd("colorscheme kanagawa-lotus")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			-- vim.cmd([[colorscheme gruvbox]])
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
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
	{
		"catppuccin/nvim",
		enabled = true,
		priority = 1000,
		config = function()
			-- vim.cmd([[colorscheme onedark]])
		end,
	},
	{
		"folke/tokyonight.nvim",
		-- priority = 1000,
		config = function()
			local transparent = false -- set to true if you would like to enable transparency

			local bg = "#011628"
			local bg_dark = "#011423"
			local bg_highlight = "#143652"
			local bg_search = "#0A64AC"
			local bg_visual = "#275378"
			local fg = "#CBE0F0"
			local fg_dark = "#B4D0E9"
			local fg_gutter = "#627E97"
			local border = "#547998"

			require("tokyonight").setup({
				style = "night",
				transparent = transparent,
				styles = {
					sidebars = transparent and "transparent" or "dark",
					floats = transparent and "transparent" or "dark",
				},
				on_colors = function(colors)
					colors.bg = bg
					colors.bg_dark = transparent and colors.none or bg_dark
					colors.bg_float = transparent and colors.none or bg_dark
					colors.bg_highlight = bg_highlight
					colors.bg_popup = bg_dark
					colors.bg_search = bg_search
					colors.bg_sidebar = transparent and colors.none or bg_dark
					colors.bg_statusline = transparent and colors.none or bg_dark
					colors.bg_visual = bg_visual
					colors.border = border
					colors.fg = fg
					colors.fg_dark = fg_dark
					colors.fg_float = fg
					colors.fg_gutter = fg_gutter
					colors.fg_sidebar = fg_dark
				end,
			})

			-- vim.cmd("colorscheme tokyonight")
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
		"NvChad/nvim-colorizer.lua",
		enabled = true,
		config = function()
			require("colorizer").setup({
				user_default_options = {
					tailwind = true,
				},
			})
		end,
	},
	{
		-- ADD themes that are installed to this list.
	"zaldih/themery.nvim",
	config = function()
		-- Minimal config
		require("themery").setup({
			themes = {
				"rose-pine-moon",
				"cyberdream",
				"vague",
				"tokyonight-moon",
				"onedark",
				"dracula",
				"gruvbox",
				"kanagawa-wave",
				"habamax",
				"catppuccin-frappe",
				"catppuccin-macchiato",
				"catppuccin-mocha",
				"onedark_dark",
				"onedark_vivid",
				"kanagawa",
				"rose-pine-main",
				"rose-pine-dawn",
			}, -- Your list of installed colorschemes.
			livePreview = true, -- Apply theme while picking. Default to true.
		})
	end,
},

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
			require("transparent").clear_prefix("themery")


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
					"PMenu",
				}, -- table: groups you don't want to clear
			})
			-- require("transparent").clear_prefix("lualine")
		end,
	},
	

	
}
