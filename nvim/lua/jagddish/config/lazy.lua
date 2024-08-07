local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "jagddish.plugins" }, { import = "jagddish.plugins.lsp" } }, {
	checker = {
		enabled = true,
		notify = false,
	},
	install = {
		missing = true,
		colorscheme = { "rose-pine-moon", "habamax" },
	},
	change_detection = {
		notify = false,
	},
})
