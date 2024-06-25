return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind Existing [B]uffers" })
			vim.keymap.set("n", "<C-p>", builtin.git_files, {})
			vim.keymap.set("n", "<C-f>", builtin.find_files, {})
			vim.keymap.set("n", "<C-g>", builtin.oldfiles, {})
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
			vim.keymap.set("n", "<leader>fg", function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end)
			vim.keymap.set("n", "<leader>pws", function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end)
			vim.keymap.set("n", "<leader>pWs", function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end)
			vim.keymap.set(
				"n",
				"<leader>;",
				":lua require('telescope.builtin').find_files({cwd = '~/.config/nvim/'})<CR>",
				{ noremap = true, silent = true }
			)

			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local icons = require("jagddish.config.icons")

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "TelescopeResults",
				callback = function(ctx)
					vim.api.nvim_buf_call(ctx.buf, function()
						vim.fn.matchadd("TelescopeParent", "\t\t.*$")
						vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
					end)
				end,
			})

			local function formattedName(_, path)
				local tail = vim.fs.basename(path)
				local parent = vim.fs.dirname(path)
				if parent == "." then
					return tail
				end
				return string.format("%s\t\t%s", tail, parent)
			end

			telescope.setup({
				file_ignore_patterns = { "%.git/." },
				-- borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
				defaults = {
					mappings = {},
					previewer = false,
					prompt_prefix = " " .. icons.ui.Telescope .. " ",
					selection_caret = icons.ui.BoldArrowRight .. " ",
					file_ignore_patterns = { "node_modules", "package-lock.json" },
					initial_mode = "insert",
					select_strategy = "reset",
					sorting_strategy = "ascending",
					color_devicons = true,
					set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
					layout_config = {
						prompt_position = "top",
						preview_cutoff = 120,
					},
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
						"--glob=!.git/",
					},
				},
				pickers = {
					find_files = {
						previewer = false,
						path_display = formattedName,
						layout_config = {
							height = 0.4,
							width = 0.6,
							prompt_position = "top",
							preview_cutoff = 120,
						},
					},
					git_files = {
						previewer = false,
						path_display = formattedName,
						layout_config = {
							height = 0.4,
							width = 0.6,
							prompt_position = "top",
							preview_cutoff = 120,
						},
					},
					buffers = {
						path_display = formattedName,
						mappings = {
							i = {
								["<c-d>"] = actions.delete_buffer,
							},
							n = {
								["<c-d>"] = actions.delete_buffer,
							},
						},
						previewer = false,
						initial_mode = "normal",
						-- theme = "dropdown",
						layout_config = {
							height = 0.4,
							width = 0.6,
							prompt_position = "top",
							preview_cutoff = 120,
						},
					},
					current_buffer_fuzzy_find = {
						previewer = true,
						layout_config = {
							prompt_position = "top",
							preview_cutoff = 120,
						},
					},
					live_grep = {
						only_sort_text = true,
						previewer = false,
						layout_config = {
							height = 0.4,
							width = 0.6,
							prompt_position = "top",
							preview_cutoff = 120,
						},
					},
					grep_string = {
						only_sort_text = true,
						previewer = true,
					},
					lsp_references = {
						show_line = false,
						previewer = true,
					},
					lsp_definitions = {
						theme = "dropdown",
						initial_mode = "normal",
					},
					lsp_declarations = {
						theme = "dropdown",
						initial_mode = "normal",
					},

					lsp_implementations = {
						theme = "dropdown",
						initial_mode = "normal",
					},
					treesitter = {
						show_line = false,
						previewer = true,
					},
					colorscheme = {
						enable_preview = true,
						previewer = false,
						layout_config = {
							height = 0.4,
							width = 0.6,
							prompt_position = "top",
							preview_cutoff = 120,
						},
					},
					help_tags = {
						enable_preview = true,
						previewer = false,
						layout_config = {
							height = 0.4,
							width = 0.6,
							prompt_position = "top",
							preview_cutoff = 120,
						},
					},
					-- command_history = {
					--   enable_preview = true,
					--   previewer = false,
					--   layout_config = {
					--     height = 0.4,
					--     width = 0.6,
					--     prompt_position = "top",
					--     preview_cutoff = 120,
					--   },
					-- },
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							previewer = false,
							initial_mode = "normal",
							sorting_strategy = "ascending",
							layout_strategy = "horizontal",
							layout_config = {
								horizontal = {
									width = 0.5,
									height = 0.4,
									preview_width = 0.6,
								},
							},
						}),
					},
					frecency = {
						default_workspace = "CWD",
						show_scores = true,
						show_unindexed = true,
						disable_devicons = false,
						ignore_patterns = {
							"*.git/*",
							"*/tmp/*",
							"*/lua-language-server/*",
						},
					},
				},
			})
			telescope.load_extension("ui-select")
			telescope.load_extension("fzf")
			-- telescope.load_extension("refactoring")
		end,
	},
}
