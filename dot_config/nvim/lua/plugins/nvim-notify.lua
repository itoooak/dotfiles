return {
	"rcarriga/nvim-notify",
	config = function()
		vim.opt.termguicolors = true

		local notify = require("notify")
		notify.setup({
			stages = "static",
		})
		vim.notify = notify
	end,
}
