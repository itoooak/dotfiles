return {
	"zbirenbaum/copilot.lua",
	dependencies = {
		-- "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
	},
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
