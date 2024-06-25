local wk = require("which-key")

-- Initially following maps are remapped
-- L -> E -> K -> N -> J -> M -> H -> I -> L
wk.register({
	-- m = { '<left>', 'Left' },
	-- M = { 'H', 'Top line of window' },

	t = { "i", "Insert" },
	T = { "I", "Insert at line start" },

	n = {
		[[(v:count > 1 ? "m'" . v:count : '') . '<down>']],
		"Down",
		expr = true,
	},
	-- n became j
	N = { "J", "Join below line" },
	-- n = { "j", "<down>", "Down" },

	-- e = {"k", "<up>", "Up"},

	-- k became n
	k = { "n", "Find next" },
	K = { "N", "Find previous" },
	-- e bcz k up
	e = { [[(v:count > 1 ? "m'" . v:count : '') . '<up>']], "Up", expr = true },
	E = { "K", "Keyword lookup" },
	--
	l = { "e", "Next end of word" },
	L = { "E", "Last char before white space" },

	-- i bczm l right
	i = { "<right>", "Right" },
	I = { "L", "Last line of window" },

	-- j = { "m", "Create mark" },
	-- J = { 'M', 'Middle line of window' },

	-- ["<c-l>"] = { "<c-i>", "Jump to previous jump point" },
}, {
	mode = { "n", "x", "o" },
})
