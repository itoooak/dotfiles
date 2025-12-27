local keymap = vim.keymap

-- leaderと衝突するため<Space>のデフォルト動作を無効化
keymap.set({ "x", "s" }, "<Space>", "<Nop>", { silent = true })

-- tab
keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "New tab" })
keymap.set("n", "<leader><C-t>", "<cmd>tabnew<CR>", { desc = "New tab" })
keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close tab" })
keymap.set("n", "<leader><C-w>", "<cmd>tabclose<CR>", { desc = "Close tab" })
keymap.set("n", "<leader>tl", "<cmd>tabnext<CR>", { desc = "Next tab" })
keymap.set("n", "<leader><C-l>", "<cmd>tabnext<CR>", { desc = "Next tab" })
keymap.set("n", "<leader>th", "<cmd>tabprevious<CR>", { desc = "Previous tab" })
keymap.set("n", "<leader><C-h>", "<cmd>tabprevious<CR>", { desc = "Previous tab" })

-- buffer
keymap.set("n", "<leader>q", "<cmd>BufferClose<CR>", { desc = "Close buffer" })
keymap.set("n", "<leader>bc", "<cmd>BufferClose<CR>", { desc = "Close buffer" })
keymap.set("n", "<leader>bC", "<cmd>BufferCloseAllButCurrent<CR>", { desc = "Close all buffer except current one" })
keymap.set("n", "<leader>bl", "<cmd>BufferNext<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>bh", "<cmd>BufferPrevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>bp", "<cmd>BufferPick<CR>", { desc = "Pick buffer" })
keymap.set("n", "<leader>bd", "<cmd>BufferPickDelete<CR>", { desc = "Pick buffer to delete" })
keymap.set("n", "<leader>br", "<cmd>BufferRestore<CR>", { desc = "Restore buffer" })
keymap.set("n", "<leader>b<", "<cmd>BufferMovePrevious<CR>", { desc = "Move buffer to left" })
keymap.set("n", "<leader>b>", "<cmd>BufferMoveNext<CR>", { desc = "Move buffer to right" })

-- terminal
keymap.set("n", "<leader>tt", "<cmd>tabnew | terminal<CR>", { silent = true, desc = "Open terminal in new tab" })
keymap.set("t", "<C-\\>", "<C-\\><C-n>", { nowait = true })

-- diagnostics
keymap.set("n", "<leader>df", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Open diagnostic float" })
keymap.set("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Next diagnostic" })
keymap.set("n", "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Previous diagnostic" })

-- LSP
keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code action" })
keymap.set("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Show declaration" })
keymap.set("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Show definition" })
keymap.set("n", "<leader>ls", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { desc = "Show symbols" })
keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", { desc = "Format" })
keymap.set("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Show implementation" })
keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Show reference" })
keymap.set("n", "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename variable" })
keymap.set("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { desc = "Show type definition" })
keymap.set(
	"n",
	"<leader>lI",
	"<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>",
	{ desc = "Toggle inlay hints" }
)

do
	vim.keymap.set("n", "]<Space>", function()
		vim.fn.append(vim.fn.line("."), "")
	end, { desc = "Add empty line below" })

	vim.keymap.set("n", "[<Space>", function()
		vim.fn.append(vim.fn.line(".") - 1, "")
	end, { desc = "Add empty line above" })
end
