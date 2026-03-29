vim.api.nvim_create_autocmd("FileType", {
	pattern = "gitcommit",
	callback = function()
		vim.keymap.set("n", "<leader>ai", function()
			local output = vim.fn.systemlist("suggest-commit-message")
			if vim.v.shell_error == 0 then
				vim.api.nvim_put(output, "l", true, true)
			else
				vim.notify("Failed to generate commit message", vim.log.levels.ERROR)
			end
		end, { buffer = true, desc = "AI commit message" })
	end,
})
