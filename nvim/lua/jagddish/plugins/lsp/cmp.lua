return {

	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		priority = 100,
		dependencies = {
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"neovim/nvim-lspconfig",
			-- "hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-buffer",
			{
				"L3MON4D3/LuaSnip",
				build = "make install_jsregexp",
				dependencies = {
					"rafamadriz/friendly-snippets", -- useful snippets
				},
			},
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			vim.opt.completeopt = { "menu", "menuone", "preview", "noselect" }
			vim.opt.shortmess:append("c")

			local lspkind = require("lspkind")
			lspkind.init({})

			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.filetype_extend("html", { "javascript" })
			luasnip.filetype_extend("typescript", { "javascript" })
			require("luasnip.loaders.from_vscode").lazy_load()
			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "mini.completion" },
					{ name = "cody" },
					{ name = "path" },
					{ name = "buffer" },
				},
				mapping = {
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<CR>"] = cmp.mapping(
						cmp.mapping.confirm({
							behavior = cmp.ConfirmBehavior.Insert,
							select = true,
						}),
						{ "i", "c" }
					),
				},

				-- Enable luasnip to handle snippet expansion for nvim-cmp
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				-- formatting = {
				-- 	-- Youtube: How to set up nice formatting for your sources.
				-- 	format = lspkind.cmp_format({
				-- 		mode = "symbol_text",
				-- 		-- TODO: Think about this, except it's not centered :'(
				-- 		-- symbol_map = {
				-- 		--   Cody = "",
				-- 		-- },
				-- 		menu = {
				-- 			buffer = "[buf]",
				-- 			nvim_lsp = "[LSP]",
				-- 			nvim_lua = "[api]",
				-- 			path = "[path]",
				-- 			luasnip = "[snip]",
				-- 			gh_issues = "[issues]",
				-- 			tn = "[TabNine]",
				-- 			eruby = "[erb]",
				-- 		},
				-- 	}),
				-- },
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
						menu = {
							buffer = "[buf]",
							nvim_lsp = "[LSP]",
							nvim_lua = "[api]",
							path = "[path]",
							luasnip = "[snip]",
							gh_issues = "[issues]",
							tn = "[TabNine]",
							eruby = "[erb]",
						},
					}),
				},
				-- cmp.setup.cmdline(":", {
				-- 	mapping = cmp.mapping.preset.cmdline(),
				-- 	sources = {
				-- 		{ name = "cmdline" },
				-- 	},
				-- }),
				-- cmp.setup.cmdline("/", {
				-- 	mapping = cmp.mapping.preset.cmdline(),
				-- 	sources = {
				-- 		{ name = "buffer" },
				-- 	},
				-- }),
			})
		end,
	},
	-- 		{
	-- 	"hrsh7th/nvim-cmp",
	-- 	dependencies = {

	-- 			"hrsh7th/cmp-nvim-lsp",
	-- 			"hrsh7th/cmp-emoji",
	-- 			"hrsh7th/cmp-buffer",
	-- 			"hrsh7th/cmp-path",
	-- 			"hrsh7th/cmp-cmdline",
	-- 			"hrsh7th/cmp-nvim-lua",
	-- 			"saadparwaiz1/cmp_luasnip",
	-- 		{
	-- 			"L3MON4D3/LuaSnip",
	-- 			build = "make install_jsregexp",
	-- 			dependencies = {
	-- 				"rafamadriz/friendly-snippets", -- useful snippets
	-- 			},
	-- 		},
	-- 		"onsails/lspkind.nvim", -- vs-code like pictograms
	-- 	},
	-- 	config = function()
	-- 		local cmp = require("cmp")
	-- 		-- require("luasnip").filetype_extend("javascript", { "javascriptreact" })
	-- 		require("luasnip").filetype_extend("javascriptreact", { "html" })
	-- 		local luasnip = require("luasnip")
	-- 		local lspkind = require("lspkind")

	-- 		require("luasnip.loaders.from_vscode").lazy_load()
	-- 		luasnip.filetype_extend("typescript", { "javascript" })

	-- 		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
	-- 		-- require("luasnip.loaders.from_vscode").lazy_load()
	-- 		-- require("luasnip.loaders.from_snipmate").lazy_load({ paths = { "./snippets" } })
	-- 		-- require("luasnip.loaders.from_snipmate").lazy_load()
	-- 		cmp.setup.cmdline("/", {
	-- 			mapping = cmp.mapping.preset.cmdline(),
	-- 			sources = {
	-- 				{ name = "buffer" },
	-- 			},
	-- 		})

	-- 		-- `:` cmdline setup.
	-- 		cmp.setup.cmdline(":", {
	-- 			mapping = cmp.mapping.preset.cmdline(),
	-- 			sources = cmp.config.sources({
	-- 				{ name = "path" },
	-- 			}, {
	-- 				{
	-- 					name = "cmdline",
	-- 					option = {
	-- 						ignore_cmds = { "Man", "!" },
	-- 					},
	-- 				},
	-- 			}),
	-- 		})
	-- 		cmp.setup({
	-- 			completion = {
	-- 				completeopt = "menu,menuone,preview,noselect",
	-- 			},
	-- 			-- tj
	-- 			-- snippet = { -- configure how nvim-cmp interacts with snippet engine
	-- 			-- 	expand = function(args)
	-- 			-- 		luasnip.lsp_expand(args.body)
	-- 			-- 	end,
	-- 			-- },
	-- 			mapping = cmp.mapping.preset.insert({
	-- 				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
	-- 				["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
	-- 				["<C-b>"] = cmp.mapping.scroll_docs(-4),
	-- 				["<C-f>"] = cmp.mapping.scroll_docs(4),
	-- 				["<C-y>"] = cmp.mapping.complete(), -- show completion suggestions
	-- 				["<C-e>"] = cmp.mapping.abort(), -- close completion window
	-- 				["<CR>"] = cmp.mapping.confirm({ select = true }),
	-- 			}),
	-- 			["<tab>"] = cmp.config.disable,
	-- 			-- sources for autocompletion
	-- 			-- sources = cmp.config.sources({
	-- 			-- 	{ name = "nvim_lsp" },
	-- 			-- 	{ name = "luasnip" }, -- snippets
	-- 			-- 	{ name = "buffer", keyword_length = 4 }, -- text within current buffer
	-- 			-- 	{ name = "path" }, -- file system paths
	-- 			-- }),

	-- 			-- tj sources
	-- 			sources = cmp.config.sources({
	-- 				{ name = "luasnip" },
	-- 				{ name = "nvim_lsp" },
	-- 				{ name = "nvim_lua" },
	-- 				{ name = "calc" },
	-- 			}, {
	-- 				{ name = "path" },
	-- 				{ name = "buffer", keyword_length = 5 },
	-- 			}, {
	-- 				{ name = "gh_issues" },
	-- 			}),

	-- 			sorting = {
	-- 				-- TODO: Would be cool to add stuff like "See variable names before method names" in rust, or something like that.
	-- 				comparators = {
	-- 					cmp.config.compare.offset,
	-- 					cmp.config.compare.exact,
	-- 					cmp.config.compare.score,

	-- 					-- copied from cmp-under, but I don't think I need the plugin for this.
	-- 					-- I might add some more of my own.
	-- 					function(entry1, entry2)
	-- 						local _, entry1_under = entry1.completion_item.label:find("^_+")
	-- 						local _, entry2_under = entry2.completion_item.label:find("^_+")
	-- 						entry1_under = entry1_under or 0
	-- 						entry2_under = entry2_under or 0
	-- 						if entry1_under > entry2_under then
	-- 							return false
	-- 						elseif entry1_under < entry2_under then
	-- 							return true
	-- 						end
	-- 					end,

	-- 					cmp.config.compare.kind,
	-- 					cmp.config.compare.sort_text,
	-- 					cmp.config.compare.length,
	-- 					cmp.config.compare.order,
	-- 				},
	-- 			},
	-- 			snippet = {
	-- 				expand = function(args)
	-- 					require("luasnip").lsp_expand(args.body)
	-- 				end,
	-- 			},
	-- 			---@diagnostic disable-next-line: missing-fields
	-- 			formatting = {
	-- 				-- Youtube: How to set up nice formatting for your sources.
	-- 				format = lspkind.cmp_format({
	-- 					mode = "symbol_text",
	-- 					-- TODO: Think about this, except it's not centered :'(
	-- 					-- symbol_map = {
	-- 					--   Cody = "",
	-- 					-- },
	-- 					menu = {
	-- 						buffer = "[buf]",
	-- 						nvim_lsp = "[LSP]",
	-- 						nvim_lua = "[api]",
	-- 						path = "[path]",
	-- 						luasnip = "[snip]",
	-- 						gh_issues = "[issues]",
	-- 						tn = "[TabNine]",
	-- 						eruby = "[erb]",
	-- 					},
	-- 				}),
	-- 			},

	-- 			-- configure lspkind for vs-code like pictograms in completion menu
	-- 			-- formatting = {
	-- 			-- 	format = lspkind.cmp_format({
	-- 			-- 		maxwidth = 50,
	-- 			-- 		ellipsis_char = "...",
	-- 			-- 	}),
	-- 			-- },
	-- 		})
	-- 	end,
	-- },
}
