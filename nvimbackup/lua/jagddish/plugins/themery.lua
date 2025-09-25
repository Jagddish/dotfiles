return {
	"zaldih/themery.nvim",
	config = function()
		-- Minimal config
		require("themery").setup({
			themes = {
				"rose-pine-moon",
				"cyberdream",
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
}
