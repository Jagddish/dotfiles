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
					t({ "", "  return (" }),
					t({ "", "    " }),
					i(2),
					t({ "", "  );", "};", "", "export default " }),
					rep(1),
					t(";"),
				}),
			},
		})

		ls.config.set_config({
			-- This tells LuaSnip to remember to keep around the last snippet.
			-- You can jump back into it even if you move outside of the selection
			history = false,
			-- This one is cool cause if you have dynamic snippets, it updates as you type!
			updateevents = "TextChanged,TextChangedI",
			-- Autosnippets:
			enable_autosnippets = true,
		})
		vim.keymap.set({ "i", "s" }, "<c-l>", function()
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			end
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<c-j>", function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end, { silent = true })
	end,
}
