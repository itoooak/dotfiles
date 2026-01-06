return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- TODO: current directoryを表示する
		require("lualine").setup()
	end,
}
