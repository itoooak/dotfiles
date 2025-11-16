return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.files").setup()
		vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>", { desc = "Open MiniFiles" })

		-- Set focused directory as current working directory
		local set_cwd = function()
			local path = (MiniFiles.get_fs_entry() or {}).path
			if path == nil then
				return vim.notify("Cursor is not on valid entry")
			end
			vim.fn.chdir(vim.fs.dirname(path))
		end

		-- Yank in register full path of entry under cursor
		local yank_path = function()
			local path = (MiniFiles.get_fs_entry() or {}).path
			if path == nil then
				return vim.notify("Cursor is not on valid entry")
			end
			vim.fn.setreg(vim.v.register, path)
		end

		-- Open path with system default handler (useful for non-text files)
		local ui_open = function()
			vim.ui.open(MiniFiles.get_fs_entry().path)
		end

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				local b = args.data.buf_id
				vim.keymap.set("n", "g~", set_cwd, { buffer = b, desc = "Set cwd" })
				vim.keymap.set("n", "go", ui_open, { buffer = b, desc = "OS open" })
				vim.keymap.set("n", "gy", yank_path, { buffer = b, desc = "Yank path" })
			end,
		})

		require("mini.trailspace").setup()
		vim.api.nvim_create_user_command("Trim", function()
			MiniTrailspace.trim()
			MiniTrailspace.trim_last_lines()
		end, { desc = "Trim trailing space and last blank lines" })

		require("mini.surround").setup({
			custom_surroundings = {
				["k"] = {
					input = { "「().-()」" },
					output = { left = "「", right = "」" },
				},
				["K"] = {
					input = { "『().-()』" },
					output = { left = "『", right = "』" },
				},
			},
		})

		local gen_ai_spec = require("mini.extra").gen_ai_spec
		require("mini.ai").setup({
			custom_textobjects = {
				B = gen_ai_spec.buffer(),
				D = gen_ai_spec.diagnostic(),
				I = gen_ai_spec.indent(),
				L = gen_ai_spec.line(),
				N = gen_ai_spec.number(),
			},
		})

		local hi_words = require("mini.extra").gen_highlighter.words
		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {
				fixme = hi_words({ "FIXME", "Fixme", "fixme" }, "MiniHipatternsFixme"),
				hack = hi_words({ "HACK", "Hack", "hack" }, "MiniHipatternsHack"),
				todo = hi_words({ "TODO", "Todo", "todo" }, "MiniHipatternsTodo"),
				note = hi_words({ "NOTE", "Note", "note" }, "MiniHipatternsNote"),
				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		})

		local miniclue = require("mini.clue")
		miniclue.setup({
			triggers = {
				-- Leader triggers
				{ mode = "n", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },

				-- Built-in completion
				{ mode = "i", keys = "<C-x>" },
				-- `g` key
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },

				-- Marks
				{ mode = "n", keys = "'" },
				{ mode = "n", keys = "`" },
				{ mode = "x", keys = "'" },
				{ mode = "x", keys = "`" },

				-- Registers
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },

				-- Window commands
				{ mode = "n", keys = "<C-w>" },

				-- `z` key
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },
			},

			clues = {
				-- Enhance this by adding descriptions for <Leader> mapping groups
				miniclue.gen_clues.builtin_completion(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.marks(),
				miniclue.gen_clues.registers(),
				miniclue.gen_clues.windows(),
				miniclue.gen_clues.z(),
			},
		})
	end,
}
