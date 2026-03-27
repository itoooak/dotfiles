vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.tabstop = 8

-- https://github.com/mrcjkb/haskell-tools.nvim#zap-quick-setup
local ht = require("haskell-tools")
local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr }

local function map(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("error", opts, { desc = desc }))
end

map("n", "<space>cl", vim.lsp.codelens.run, "Run CodeLens")
map("n", "<space>sh", ht.hoogle.hoogle_signature, "Hoogle signature")
map("n", "<space>va", ht.lsp.buf_eval_all, "Evaluate all snippets")
map("n", "<leader>rr", ht.repl.toggle, "Toggle repl for package")
map("n", "<leader>rf", function()
	ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, "Toggle repl for current buffer")
map("n", "<leader>rq", ht.repl.quit, "Quit repl")
