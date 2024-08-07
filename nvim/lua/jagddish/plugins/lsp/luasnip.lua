return {
	"L3MON4D3/LuaSnip",
	event = "InsertEnter",
	config = function()
		require("luasnip").filetype_extend("javascript", { "javascriptreact" })
		require("luasnip").filetype_extend("javascript", { "html" })
		local ls = require("luasnip")
		local extra = require("luasnip.extras")
		local s = ls.snippet
		local t = ls.text_node
		local i = ls.insert_node
		local f = ls.function_node
		local rep = extra.rep

		-- ls.add_snippets("javascript", {
		-- 	s("sfc", {
		-- 		t('console.log("hello world")'),
		-- 	}),
		-- })

		ls.add_snippets(nil, {
			all = {
				s("sfc", {
					t("const "),
					i(1),
					t(" = () => {"),
					t({ "", "  return (<>" }),
					t({ "", "    " }),
					i(2),
					t({ "", "  </>);", "};", "", "export default " }),
					rep(1),
					t(";"),
				}),
				s("cc", {
					t("const "),
					i(1, "name"), -- Default text "name" for the first placeholder
					t(" = "),
					i(2, ""), -- Default text "value" for the second placeholder
				}),
			},
		})

		-- ls.config.set_config({
		-- 	-- This tells LuaSnip to remember to keep around the last snippet.
		-- 	-- You can jump back into it even if you move outside of the selection
		-- 	history = false,
		-- 	-- This one is cool cause if you have dynamic snippets, it updates as you type!
		-- 	updateevents = "TextChanged,TextChangedI",
		-- 	-- Autosnippets:
		-- 	enable_autosnippets = true,
		-- })
		-- vim.keymap.set({ "i", "s" }, "<c-l>", function()
		-- 	if ls.expand_or_jumpable() then
		-- 		ls.expand_or_jump()
		-- 	end
		-- end, { silent = true })
		-- vim.keymap.set({ "i", "s" }, "<c-j>", function()
		-- 	if ls.jumpable(-1) then
		-- 		ls.jump(-1)
		-- 	end
		-- end, { silent = true })

		-------- new ---------
		vim.snippet.expand = ls.lsp_expand

		---@diagnostic disable-next-line: duplicate-set-field
		vim.snippet.active = function(filter)
			filter = filter or {}
			filter.direction = filter.direction or 1

			if filter.direction == 1 then
				return ls.expand_or_jumpable()
			else
				return ls.jumpable(filter.direction)
			end
		end

		---@diagnostic disable-next-line: duplicate-set-field
		vim.snippet.jump = function(direction)
			if direction == 1 then
				if ls.expandable() then
					return ls.expand_or_jump()
				else
					return ls.jumpable(1) and ls.jump(1)
				end
			else
				return ls.jumpable(-1) and ls.jump(-1)
			end
		end

		vim.snippet.stop = ls.unlink_current

		-- ================================================
		--      My Configuration
		-- ================================================
		ls.config.set_config({
			history = true,
			updateevents = "TextChanged,TextChangedI",
			override_builtin = true,
		})

		-- for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
		--   loadfile(ft_path)()
		-- end

		vim.keymap.set({ "i", "s" }, "<c-k>", function()
			return vim.snippet.active({ direction = 1 }) and vim.snippet.jump(1)
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<c-j>", function()
			return vim.snippet.active({ direction = -1 }) and vim.snippet.jump(-1)
		end, { silent = true })
	end,
}
