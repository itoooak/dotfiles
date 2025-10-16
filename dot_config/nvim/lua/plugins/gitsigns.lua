return {
	"lewis6991/gitsigns.nvim",
	config = function()
		-- mini.diffのカラーコードを真似している
		vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#a3be8c" })
		vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#ebcb8b" })
		vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#bf616a" })

		require("gitsigns").setup({
			current_line_blame = true,
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "-" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "┃" },
				untracked = { text = "┆" },
			},

			-- https://github.com/lewis6991/gitsigns.nvim/blob/1ee5c1fd068c81f9dd06483e639c2aa4587dc197/README.md
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Actions
				map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
				map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset Hunk" })

				map("v", "<leader>hs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Stage Hunk" })

				map("v", "<leader>hr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Reset Hunk" })

				map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview Hunk" })
				map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Preview Hunk Inline" })

				map("n", "<leader>hb", function()
					gitsigns.blame_line({ full = true })
				end, { desc = "Blame Line" })

				map("n", "<leader>hd", gitsigns.diffthis, { desc = "Diff This" })

				map("n", "<leader>hD", function()
					gitsigns.diffthis("~")
				end, { desc = "Diff This ~" })

				map("n", "<leader>hQ", function()
					gitsigns.setqflist("all")
				end, { desc = "Set QF list (all)" })
				map("n", "<leader>hq", gitsigns.setqflist, { desc = "Set QF list" })

				-- Toggles
				map("n", "<leader>htb", gitsigns.toggle_current_line_blame, { desc = "Toggle Current Line Blame" })
				map("n", "<leader>htw", gitsigns.toggle_word_diff, { desc = "Toggle Word Diff" })

				-- Text object
				map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Select Hunk" })
			end,
		})
	end,
}
