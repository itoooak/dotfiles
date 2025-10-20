return {
	"lambdalisue/vim-gin",
	dependencies = {
		"vim-denops/denops.vim",
	},
	config = function()
		vim.keymap.set("n", "<leader>gb", "<cmd>GinBranch<CR>", { desc = "GinBranch" })
		vim.keymap.set("n", "<leader>gB", "<cmd>GinBlame %<CR>", { desc = "GinBlame %" })
		vim.keymap.set("n", "<leader>gc", "<cmd>Gin commit<CR>", { desc = "Gin commit" })
		vim.keymap.set("n", "<leader>gd", "<cmd>GinDiff<CR>", { desc = "GinDiff" })
		vim.keymap.set("n", "<leader>gD", "<cmd>GinDiff --staged<CR>", { desc = "GinDiff --staged" })
		vim.keymap.set("n", "<leader>gl", "<cmd>GinLog<CR>", { desc = "GinLog" })
		vim.keymap.set("n", "<leader>gs", "<cmd>GinStatus<CR>", { desc = "GinStatus" })

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "gin-branch", "gin-diff", "gin-log", "gin-status" },
			callback = function()
				vim.keymap.set("n", "q", "<cmd>bdelete<CR>", { buffer = true })
			end,
		})
	end,
}
