return {
	"hrsh7th/nvim-insx",
	config = function()
		require("insx.preset.standard").setup()

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "rust", "ocaml", "haskell", "lisp", "scheme" },
			callback = function()
				local opts = { buffer = true }
				vim.keymap.set("i", "'", "'", opts)
			end,
		})
	end,
}
