return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.ACTIVE, function(bufnr)
			return vim.b[bufnr].large_file_detected ~= true
		end)

		require("ibl").setup({})
	end,
}
