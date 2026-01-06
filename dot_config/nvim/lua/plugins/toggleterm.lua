local term_counter = 0

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{
			"<C-\\>",
			function()
				if vim.t.my_term_id == nil then
					term_counter = term_counter + 1
					vim.t.my_term_id = term_counter
				end

				require("toggleterm").toggle(vim.t.my_term_id)
			end,
			mode = { "n" },
			desc = "Toggle Tab-Local Terminal",
		},
	},
	opts = {
		open_mapping = nil,
		direction = "float",
	},
}
