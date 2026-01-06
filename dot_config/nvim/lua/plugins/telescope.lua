return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- optional
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
		-- plugin
		"rcarriga/nvim-notify",
		"jvgrootveld/telescope-zoxide",
		"LukasPietzschmann/telescope-tabs",
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Telescope find files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Telescope live grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Telescope buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Telescope help tags" },
		{ "<leader>fc", "<cmd>Telescope commands<CR>", desc = "Telescope commands" },
		{ "<leader>fC", "<cmd>Telescope command_history<CR>", desc = "Telescope command history" },
		{ "<leader>fq", "<cmd>Telescope quickfix<CR>", desc = "Telescope quickfix" },
		{ "<leader>fQ", "<cmd>Telescope quickfixhistory<CR>", desc = "Telescope quickfix history" },
		{ "<leader>fB", "<cmd>Telescope builtin<CR>", desc = "Telescope builtin" },
		{ "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Telescope oldfiles" },
		-- nvim-notify
		{ "<leader>fn", "<cmd>Telescope notify<CR>", desc = "Telescope notify" },
		-- telescope-zoxide
		{ "<leader>fz", "<cmd>Telescope zoxide list<CR>", desc = "Telescope zoxide list" },
		-- telescope-tabs
		-- TODO: 選択画面でcurrent directoryを表示する
		{ "<leader>ft", "<cmd>Telescope telescope-tabs list_tabs<CR>", desc = "Telescope telescope-tabs list_tabs" },
	},
}
