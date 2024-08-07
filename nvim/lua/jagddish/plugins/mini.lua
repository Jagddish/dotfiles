return {
	{
		"echasnovski/mini.ai",
		-- "echasnovski/mini.surround",
		enabled = true,
		version = "*",
		config = function()
			require("mini.ai").setup({})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		opts = {},
		-- enabled = false,
		config = function()
			require("lsp_signature").setup({
				bind = true, -- This is mandatory, otherwise border config won't get registered.
				handler_opts = {
					border = "rounded", -- rounded, single, shadow, none, double
				},
				padding = " ",
				floating_window = false,
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
