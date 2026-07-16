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
		"ocaml",
		"markdown",
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

local LARGE_FILE_THRESHOLD = 1 * 1024 * 1024 -- 1MiB

vim.api.nvim_create_autocmd("BufReadPre", {
	pattern = "*",
	callback = function(args)
		local bufnr = args.buf
		local filepath = vim.api.nvim_buf_get_name(bufnr)

		if vim.bo[bufnr].buftype ~= "" then
			return
		end

		local stat = vim.uv.fs_stat(filepath)
		if stat and stat.size > LARGE_FILE_THRESHOLD then
			vim.notify("Large file detected. Some features have been disabled.")

			vim.b[bufnr].large_file_detected = true

			vim.opt_local.swapfile = false
			vim.opt_local.undofile = false
			vim.opt_local.undolevels = -1
			vim.opt_local.undoreload = 0
			vim.opt_local.foldmethod = "manual"
			vim.opt_local.spell = false
			vim.opt_local.syntax = ""
			vim.opt_local.filetype = ""

			if vim.fn.exists(":NoMatchParen") == 2 then
				vim.cmd("NoMatchParen")
			end
		end
	end,
})
