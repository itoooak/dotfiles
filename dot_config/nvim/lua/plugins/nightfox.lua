return {
	"EdenEast/nightfox.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("nightfox").setup({
			groups = {
				all = {
					LspCodeLens = { fg = "palette.fg3", style = "italic" },
				},
			},
		})
		vim.cmd([[colorscheme nordfox]])
	end,
}
