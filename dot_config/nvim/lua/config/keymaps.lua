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
keymap.set("n", "<leader>bc", "<cmd>BufferClose<CR>", { desc = "Close buffer" })
keymap.set("n", "<leader>bC", "<cmd>BufferCloseAllButCurrent<CR>", { desc = "Close all buffer except current one" })
keymap.set("n", "<leader>bl", "<cmd>BufferNext<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>bh", "<cmd>BufferPrevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>bp", "<cmd>BufferPick<CR>", { desc = "Pick buffer" })
keymap.set("n", "<leader>bd", "<cmd>BufferPickDelete<CR>", { desc = "Pick buffer to delete" })

-- terminal
keymap.set("n", "<leader>tt", "<cmd>tabnew | terminal<CR>", { silent = true, desc = "Open terminal in new tab" })
keymap.set("n", "<leader>tx", "<cmd>belowright | terminal<CR>", { silent = true, desc = "Open terminal in new split" })

-- diagnostics
keymap.set("n", "<leader>i", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Open diagnostic float" })
