return {
	"rcarriga/nvim-notify",
	lazy = false,
	config = function()
		vim.opt.termguicolors = true

		local notify = require("notify")
		notify.setup({
			stages = "static",
		})
		vim.notify = notify

		vim.keymap.set("n", "<Esc>", function()
			notify.dismiss({ silent = true, pending = true })
			vim.cmd("noh")
		end, { desc = "Dismiss notification windows" })
	end,
}
