vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"markdown",
		"typst",
		"text",
		"gitcommit",
		"plaintex",
		"tex",
	},
	command = "setlocal wrap",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"json",
		"yaml",
		"toml",
		"nix",
		"html",
		"css",
		"javascript",
		"typescript",
		"jsx",
		"tsx",
	},
	callback = function()
		local o = vim.opt_local
		o.expandtab = true
		o.shiftwidth = 2
		o.softtabstop = 2
		o.tabstop = 2
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "gitcommit",
	callback = function()
		vim.keymap.set("n", "<leader>ai", function()
			local cmd
			if vim.fn.has("win32") == 1 then
				local script_path = vim.fn.expand("~/.local/bin/suggest-commit-message.ps1")
				cmd = string.format('powershell -NoProfile -File "%s"', script_path)
			else
				cmd = "suggest-commit-message"
			end

			local output = vim.fn.systemlist(cmd)
			if vim.v.shell_error == 0 then
				vim.api.nvim_put(output, "l", true, true)
			else
				local error_msg = table.concat(output, "\n")
				vim.notify(
					string.format("Failed to generate commit message (exit code: %d)\n%s", vim.v.shell_error, error_msg),
					vim.log.levels.ERROR
				)
			end
		end, { buffer = true, desc = "AI commit message" })
	end,
})
