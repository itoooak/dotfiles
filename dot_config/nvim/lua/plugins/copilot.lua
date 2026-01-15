return {
	"zbirenbaum/copilot.lua",
	event = "VeryLazy",
	dependencies = {},
	config = function()
		require("copilot").setup({
			filetypes = {
				markdown = false,
				typst = false,
			},
			suggestion = {
				keymap = {
					accept = "<M-y>",
					dismiss = "<C-]>",
				},
			},
		})
	end,
}
