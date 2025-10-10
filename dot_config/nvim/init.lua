vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "startinsert",
})

require("config/options")
require("config/keymaps")
require("config/lazy")
