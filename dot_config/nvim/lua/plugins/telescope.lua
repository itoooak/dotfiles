local builtin = require("telescope.builtin")

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- optional
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>ff", builtin.find_files, desc = "Telescope find files" },
		{ "<leader>fg", builtin.live_grep, desc = "Telescope live grep" },
		{ "<leader>fb", builtin.buffers, desc = "Telescope buffers" },
		{ "<leader>fh", builtin.help_tags, desc = "Telescope help tags" },
		{ "<leader>fc", builtin.commands, desc = "Telescope commands" },
		{ "<leader>fC", builtin.command_history, desc = "Telescope command history" },
		{ "<leader>fq", builtin.quickfix, desc = "Telescope quickfix" },
		{ "<leader>fQ", builtin.quickfixhistory, desc = "Telescope quickfix history" },
		-- nvim-notify
		{ "<leader>fn", "<cmd>Telescope notify<CR>", desc = "Telescope notify" },
	},
}
