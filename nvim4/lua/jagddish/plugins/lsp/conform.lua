return {
--   "stevearc/conform.nvim",
--   opts = {
--       formatters_by_ft = {
--           lua = { "stylua" },
--           -- Conform will run multiple formatters sequentially
--           python = { "isort", "black" },
--           -- You can customize some of the format options for the filetype (:help conform.format)
--           rust = { "rustfmt" },
--           -- Conform will run the first available formatter
--           javascript = { "prettierd", "prettier", stop_after_first = true },
--           typescript = { "prettierd", "prettier", stop_after_first = true },
--       },
--       format_on_save = {
--           -- These options will be passed to conform.format()
--           timeout_ms = 500,
--           lsp_format = "fallback",
--       },
--   },

  {

	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				java = { "google-java-format" },
			},
			format_on_save = {
				lsp_fallback = true,
				quiet = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
  },
}