return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- "mfussenegger/nvim-jdtls",
		"saghen/blink.cmp",
		"williamboman/mason.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"j-hui/fidget.nvim",
		-- { "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		{
			"nvim-lua/plenary.nvim",
		},
	},
	config = function()
		-- import lspconfig plugin
		require("fidget").setup({})
		-- local lspconfig = require("lspconfig")
		local mason = require("mason")
		local mason_tool_installer = require("mason-tool-installer")
		local mason_lspconfig = require("mason-lspconfig")

		require("conform").setup({
			formatters_by_ft = {},
		})
		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"html",
				"ts_ls",
				-- "jdtls",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_language_server",
				"prismals",
				"pyright",
			},
		})
		-- require("lspconfig.ui.windows").default_options.border = "single"
		-- mason_tool_installer.setup({
		-- 	ensure_installed = {
		-- 		"prettier", -- prettier formatter
		-- 		"stylua", -- lua formatter
		-- 		"isort", -- python formatter
		-- 		"black", -- python formatter
		-- 		"pylint",
		-- 		-- "google-java-format",
		-- 		"eslint_d",
		-- 	},
		-- 	auto_install = true,
		-- })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- -- set keybinds
				-- opts.desc = "Show LSP references"
				-- keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
				--
				-- opts.desc = "Go to declaration"
				-- keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
				--
				-- opts.desc = "Show LSP definitions"
				-- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
				--
				-- opts.desc = "Show LSP implementations"
				-- keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
				--
				-- opts.desc = "Show LSP type definitions"
				-- keymap.set("n", "gT", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
				--
				-- opts.desc = "See available code actions"
				-- keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
				--
				-- opts.desc = "Smart rename"
				-- keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts) -- smart rename
				--
				-- opts.desc = "Show buffer diagnostics"
				-- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
				--
				-- -- opts.desc = "Show line diagnostics"
				-- -- keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
				--
				-- opts.desc = "Go to previous diagnostic"
				-- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
				--
				-- opts.desc = "Go to next diagnostic"
				-- keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
				--
				-- opts.desc = "Show documentation for what is under cursor"
				-- keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				-- opts.desc = "Restart LSP"
				-- keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
				map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
				map("gr", require("telescope.builtin").lsp_references, "Goto References")
				map("gi", require("telescope.builtin").lsp_implementations, "Goto Implementation")
				map("go", require("telescope.builtin").lsp_type_definitions, "Type Definition")
				map("<leader>p", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
				map("<leader>P", require("telescope.builtin").lsp_workspace_symbols, "Workspace Symbols")
				map("<leader>Ps", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")

				-- Custom handler for hover window
				vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
					-- Set the border to a single line
					border = "single",

					-- Set maximum width and height
					max_width = 80,
					max_height = 30,

					-- Customize width and height of the window
					width = 60,
					height = 8,
				})

				-- Map "K" to the hover documentation function
				vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

				map("gl", vim.diagnostic.open_float, "Open Diagnostic Float")
				-- map("K", vim.lsp.buf.hover, "Hover Documentation")
				map("gs", vim.lsp.buf.signature_help, "Signature Documentation")
				map("gD", vim.lsp.buf.declaration, "Goto Declaration")

				map("<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")

				local wk = require("which-key")
				wk.add({
					{ "<leader>la", vim.lsp.buf.code_action, desc = "Code Action" },
					{ "<leader>lA", vim.lsp.buf.range_code_action, desc = "Range Code Actions" },
					{
						"<leader>ls",
						vim.lsp.buf.signature_help,
						desc = "Display Signature Information",
					},
					{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename all references" },
					{ "<leader>lf", vim.lsp.buf.format, desc = "Format" },
					{ "<leader>li", require("telescope.builtin").lsp_implementations, desc = "Implementation" },
					{ "<leader>lw", require("telescope.builtin").diagnostics, desc = "Diagnostics" },

					-- W = {
					--   name = "+Workspace",
					--   a = { vim.lsp.buf.add_workspace_folder, "Add Folder" },
					--   r = { vim.lsp.buf.remove_workspace_folder, "Remove Folder" },
					--   l = {
					--     function()
					--       print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					--     end,
					--     "List Folders",
					--   },
					-- },

					{ "<leader>Wa", vim.lsp.buf.add_workspace_folder, desc = "Workspace Add Folder" },
					{
						"<leader>Wr",
						vim.lsp.buf.remove_workspace_folder,
						desc = "Workspace Remove Folder",
					},
					{
						"<leader>Wl",
						function()
							print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
						end,
						desc = "Workspace List Folders",
					},
				})
			end,
		})

		local nvim_lsp = require("lspconfig")
		nvim_lsp.denols.setup({
			on_attach = on_attach,
			root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
		})

		nvim_lsp.ts_ls.setup({
			on_attach = on_attach,
			root_dir = nvim_lsp.util.root_pattern("package.json"),
			single_file_support = false,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		-- local capabilities = cmp_nvim_lsp.default_capabilities()
		-- local capabilities = require("blink.cmp").get_lsp_capabilities()
		-- require("lspconfig").lua_ls.setup({ capabilities = capabilities })

		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("lspconfig").ts_ls.setup({
			capabilities = capabilities,
		})
		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
		vim.diagnostic.config({
			title = false,
			underline = true,
			virtual_text = true,
			signs = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				source = "if_many",
				style = "minimal",
				border = "rounded",
				header = "",
				prefix = "",
			},
		})
		-- mason_lspconfig.setup_handlers({
		-- 	-- default handler for installed servers
		-- 	function(server_name--[[ ) ]]
		-- 		lspconfig[server_name].setup({
		-- 			capabilities = capabilities,
		-- 		})
		-- 	end,
		-- })
	end,
}
