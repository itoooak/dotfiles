if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
	-- :help shell-powershell
	local opt = vim.opt
	opt.shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell"
	opt.shellcmdflag =
		[[-NoLogo -NonInteractive -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';$PSStyle.OutputRendering='plaintext';Remove-Alias -Force -ErrorAction SilentlyContinue tee;]]
	opt.shellredir = [[2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode]]
	opt.shellpipe = [[2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode]]
	opt.shellquote = ""
	opt.shellxquote = ""
end
