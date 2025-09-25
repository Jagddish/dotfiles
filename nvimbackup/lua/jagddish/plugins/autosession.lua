return {
	"rmagatti/auto-session",
	lazy = false,
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		-- Will use Telescope if installed or a vim.ui.select picker otherwise
		{ "<leader>ws", "<cmd>SessionSave<CR>", desc = "Save session" },
		{ "<leader>wr", "<cmd>SessionRestore<CR>", desc = "Restore session" },

		{ "<C-s>", "<cmd>SessionSearch<CR>", desc = "Session search" },
	},
	config = function()
		require("auto-session").setup({
			auto_restore_enabled = true,
			auto_session_enable_last_session = false,
			auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop/" },
			session_lens = {
				-- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
				buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
				load_on_setup = true,
				theme_conf = { border = true },
				previewer = false,
			},
		})
	end,
}
