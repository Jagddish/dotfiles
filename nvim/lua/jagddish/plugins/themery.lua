return {
	"zaldih/themery.nvim",
	config = function()
		-- Minimal config
		require("themery").setup({
			themes = {
				"onedark",
				"onedark_dark",
				"onedark_vivid",
				"habamax",
				"kanagawa",
				"kanagawa-wave",
				"gruvbox",
				"rose-pine-main",
				"rose-pine-dawn",
				"rose-pine-moon",
				"tokyonight-moon",
				"dracula",
			}, -- Your list of installed colorschemes.
			livePreview = true, -- Apply theme while picking. Default to true.
		})
	end,
}
