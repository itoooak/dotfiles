return {
	"lewis6991/gitsigns.nvim",
	config = function()
		-- mini.diffのカラーコードを真似している
		vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#a3be8c" })
		vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#ebcb8b" })
		vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#bf616a" })

		require("gitsigns").setup({
			current_line_blame = true,
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "-" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "┃" },
				untracked = { text = "┆" },
			},
		})
	end,
}
