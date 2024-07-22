return {
	{
		"echasnovski/mini.ai",
		version = "*",
		config = function()
			require("mini.ai").setup({})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		opts = {},
		config = function()
			require("lsp_signature").setup({
				bind = true, -- This is mandatory, otherwise border config won't get registered.
				handler_opts = {
					border = "rounded", -- rounded, single, shadow, none, double
				},
				padding = " ",
			})
		end,
	},
	-- {
	-- 	"echasnovski/mini.completion",
	-- 	version = "*",
	-- 	config = function()
	-- 		require("mini.completion").setup({})
	-- 	end,
	-- },
}
