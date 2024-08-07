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

			local lspkind_ok, lspkind = require("lspkind")
			-- lspkind.init({})

			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.filetype_extend("html", { "javascript" })
			luasnip.filetype_extend("typescript", { "javascript" })
			require("luasnip.loaders.from_vscode").lazy_load()
			-- Get the background color of the 'Normal' highlight group
			local normal_bg = vim.api.nvim_get_hl_by_name("Normal", true).background
			-- if above line stops working uncomment below 2  lines
			-- local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
			-- local normal_bg = normal_hl and normal_hl.bg or "#212121" -- Default to a specific color if not found

			-- Set the background color for 'CmpNormal' and 'CmpDocNormal' to match 'Normal'
			vim.api.nvim_set_hl(0, "CmpNormal", { bg = normal_bg })
			vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = normal_bg })
			local kind_icons = {
				Text = "",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰇽",
				Variable = "󰂡",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "󰅲",
			}

			cmp.setup({
				window = {
					completion = {
						border = "rounded",
						winhighlight = "Normal:CmpNormal",
					},
					documentation = {
						winhighlight = "Normal:CmpDocNormal",
						border = "rounded",
					},
				},
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
				-- formatting = {
				-- 	fields = { "kind", "abbr", "menu" },
				-- 	format = lspkind.cmp_format({
				-- 		mode = "symbol_text",
				-- 		maxwidth = 50,
				-- 		ellipsis_char = "...",
				-- 		menu = {
				-- 			buffer = "[buf]",
				-- 			nvim_lsp = "[LSP]",
				-- 			luasnip = "[snip]",
				-- 			nvim_lua = "[api]",
				-- 			path = "[path]",
				-- 			gh_issues = "[issues]",
				-- 			tn = "[TabNine]",
				-- 			eruby = "[erb]",
				-- 		},
				-- 	}),
				-- },

				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						lspkind_ok, lspkind = pcall(require, "lspkind")
						if not lspkind_ok then
							-- From kind_icons array
							vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
							-- Source
							vim_item.menu = ({
								nvim_lsp = "[LSP]",
								luasnip = "[LuaSnip]",
								buffer = "[Buffer]",
								nvim_lua = "[Lua]",
							})[entry.source.name]
							return vim_item
						else
							-- From lspkind
							return lspkind.cmp_format()(entry, vim_item)
						end
					end,
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
}
