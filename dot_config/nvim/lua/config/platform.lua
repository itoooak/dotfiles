if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
	-- :help shell-pwsh
	local opt = vim.opt
	opt.shelltemp = false
	opt.shell = "pwsh"
	opt.shellcmdflag = table.concat({
		"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command ",
		"[Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();",
		"$PSDefaultParameterValues['Out-File:Encoding']='utf8';",
		"$PSStyle.OutputRendering='PlainText';",
	})
	opt.shellpipe = [[> %s 2>&1]]
	opt.shellquote = ""
	opt.shellxquote = ""
	vim.env.__SuppressAnsiEscapeSequences = 1
end
