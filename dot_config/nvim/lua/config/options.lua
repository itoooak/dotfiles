local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.wrap = false
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"markdown",
		"typst",
		"text",
		"gitcommit",
		"plaintex",
	},
	command = "setlocal wrap",
})

opt.cursorline = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.termguicolors = true

opt.clipboard:append("unnamedplus,unnamed")

opt.ignorecase = true
opt.smartcase = true

opt.completeopt = "menuone,popup,noselect"
