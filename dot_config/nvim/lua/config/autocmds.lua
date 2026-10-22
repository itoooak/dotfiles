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
