return {
	"zbirenbaum/copilot.lua",
	dependencies = {},
	config = function()
		require("copilot").setup({
			filetypes = {
				markdown = false,
				typst = false,
			},
			suggestion = {
				keymap = {
					accept = "<C-y>",
					dismiss = "<C-]>",
				},
			},
		})
	end,
}
