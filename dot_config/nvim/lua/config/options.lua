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

if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
	-- :help shell-powershell
	opt.shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell"
	opt.shellcmdflag =
		[[-NoLogo -NonInteractive -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';$PSStyle.OutputRendering='plaintext';Remove-Alias -Force -ErrorAction SilentlyContinue tee;]]
	opt.shellredir = [[2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode]]
	opt.shellpipe = [[2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode]]
	opt.shellquote = ""
	opt.shellxquote = ""
end
