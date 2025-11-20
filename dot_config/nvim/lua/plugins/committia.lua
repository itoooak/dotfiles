return {
	"rhysd/committia.vim",
	dependencies = {
		"lambdalisue/vim-gin",
	},
	keys = {
		{
			"<leader>gC",
			function()
				vim.g.committia_open_only_vim_starting = 0

				vim.api.nvim_create_autocmd("FileType", {
					pattern = "gitcommit",
					once = true,
					callback = function()
						vim.schedule(function()
							vim.g.committia_open_only_vim_starting = 1
						end)
					end,
				})

				vim.cmd("Gin commit")
			end,
			desc = "Gin commit with committia",
		},
	},
}
