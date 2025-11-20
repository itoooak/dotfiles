return {
	"lambdalisue/vim-gin",
	dependencies = {
		"vim-denops/denops.vim",
	},
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "gin-branch", "gin-diff", "gin-log", "gin-status" },
			callback = function()
				vim.keymap.set("n", "q", "<cmd>bdelete<CR>", { buffer = true })
			end,
		})
	end,
	keys = {
		{ "<leader>gb", "<cmd>GinBranch<CR>", desc = "GinBranch" },
		{ "<leader>gB", "<cmd>GinBlame %<CR>", desc = "GinBlame %" },
		{ "<leader>gc", "<cmd>Gin commit<CR>", desc = "Gin commit" },
		{ "<leader>gd", "<cmd>GinDiff<CR>", desc = "GinDiff" },
		{ "<leader>gD", "<cmd>GinDiff --staged<CR>", desc = "GinDiff --staged" },
		{ "<leader>gl", "<cmd>GinLog<CR>", desc = "GinLog" },
		{ "<leader>gs", "<cmd>GinStatus<CR>", desc = "GinStatus" },
	},
}
