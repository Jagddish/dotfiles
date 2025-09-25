local function current_date()
	return os.date("%a %d") -- Format: abbreviated weekday name and day of the month
end
-- Define custom function to show the current directory with an icon and color
local function show_directory()
	local icon = "" -- Directory icon

	-- Get the current working directory and extract the directory name
	local cwd = vim.fn.getcwd()
	local dir_name = vim.fn.fnamemodify(cwd, ":t")

	-- Format the output
	local dir = string.format("%s %s", icon, dir_name)

	return dir
end
local function current_time()
	return os.date("%I:%M%p "):upper() -- 12-hour format with AM/PM
end
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- event = { "BufReadPost", },
	config = function()
		local status_ok, lualine = pcall(require, "lualine")
		if not status_ok then
			return
		end

		-- te
		local hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end
		local spaces = {
			function()
				return " "
			end,
			padding = -1,
		}

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = {
				"error",
				"warn",
				-- "hint",
			},
			symbols = {
				error = " ",
				warn = " ",
				-- hint = " ",
				-- info = " ",
			},
			colored = true,
			always_visible = false,
		}

		local branch = {
			"branch",
			-- icon = "",
			icon = "",
			color = { fg = "ECFF7C" },
			-- separator = { left = "", right = "" },
			padding = 1,
		}

		local diff = {
			"diff",
			colored = true,
			symbols = {
				added = " ",
				modified = " ", -- "󰏫",
				removed = " ",
			},
			-- separator = { left = "", right = "" },
		}

		local filetype = {
			"filetype",
			icons_enabled = true,
		}

		local location = {
			-- "location",
			-- separator = { right = "" },
		}

		local custom_icons = {
			function()
				return "󰅬"
			end,
			-- separator = { left = "", right = "" },
			color = { fg = "#86AAEC", bg = "" },
		}

		local modes = {
			"mode",
			-- separator = { left = "", right = "" },
			color = { fg = "#86AAEC", bg = "" },
			padding = 0.8,
		}
		local function show_macro_recording()
			local recording_register = vim.fn.reg_recording()
			if recording_register == "" then
				return ""
			else
				return "Recording @" .. recording_register
			end
		end

		local indent = function()
			return "" .. vim.api.nvim_buf_get_option(0, "shiftwidth")
		end

		local lsp_progess = function()
			msg = msg
			local buf_clients = vim.lsp.get_clients()
			if next(buf_clients) == nil then
				-- TODO: clean up this if statement
				if type(msg) == "boolean" or #msg == 0 then
					return "LS Inactive"
				end
				return msg
			end
			local buf_ft = vim.bo.filetype
			local buf_client_names = {}
			local copilot_active = false
			local null_ls = require("null-ls")
			local alternative_methods = {
				null_ls.methods.DIAGNOSTICS,
				null_ls.methods.DIAGNOSTICS_ON_OPEN,
				null_ls.methods.DIAGNOSTICS_ON_SAVE,
			}

			-- add client
			for _, client in pairs(buf_clients) do
				if client.name ~= "null-ls" and client.name ~= "copilot" then
					table.insert(buf_client_names, client.name)
				end

				if client.name == "copilot" then
					copilot_active = true
				end
			end

			function list_registered_providers_names(filetype)
				local s = require("null-ls.sources")
				local available_sources = s.get_available(filetype)
				local registered = {}
				for _, source in ipairs(available_sources) do
					for method in pairs(source.methods) do
						registered[method] = registered[method] or {}
						table.insert(registered[method], source.name)
					end
				end
				return registered
			end

			function list_registered(filetype)
				local registered_providers = list_registered_providers_names(filetype)
				local providers_for_methods = vim.tbl_flatten(vim.tbl_map(function(m)
					return registered_providers[m] or {}
				end, alternative_methods))
				return providers_for_methods
			end

			function formatters_list_registered(filetype)
				local registered_providers = list_registered_providers_names(filetype)
				return registered_providers[null_ls.methods.FORMATTING] or {}
			end

			-- linters
			local supported_linters = list_registered(buf_ft)
			vim.list_extend(buf_client_names, supported_linters)
			local unique_client_names = vim.fn.uniq(buf_client_names)

			local language_servers = " " .. table.concat(unique_client_names, ", ") .. ""

			if copilot_active then
				language_servers = language_servers .. "%#SLCopilot#" .. ""
			end

			return language_servers
		end

		lualine.setup({
			options = {
				globalstatus = true,
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "dashboard", "packer", "neo-tree" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = {
					custom_icons,
					modes,
				},
				lualine_b = {
					{
						"macro-recording",
						fmt = show_macro_recording,
					},
					{ show_directory, color = { fg = "#f2f5fa" } },
				},
				lualine_c = {
					spaces,
					branch,
					diff,

					-- require("auto-session.lib").current_session_name,
				},
				lualine_x = {
					diagnostics,
					{
						lsp_progess,
					},
					"progress",
					{
						function()
							return ""
						end,
						-- separator = { left = "", right = "" },
						color = { fg = "#86AAEC" },
						padding = 0.1,
					},
					location,
				},
				lualine_y = {},
				lualine_z = {
					{
						current_date,
						color = { fg = "#f2f5fa" }, -- Set custom foreground color for date
					},
					{ current_time, color = { fg = "#f2f5fa" } },
				},
			},
		})
	end,
}
