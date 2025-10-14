return {
    "nvim-mini/mini.nvim",
    version = false,
    config = function()
        require("mini.files").setup()
        vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>", { desc = "Open MiniFiles" })

        require("mini.notify").setup()
        vim.notify = require("mini.notify").make_notify({})

        require("mini.trailspace").setup()
        vim.api.nvim_create_user_command("Trim", function()
            MiniTrailspace.trim()
            MiniTrailspace.trim_last_lines()
        end, { desc = "Trim trailing space and last blank lines" })

        require("mini.pairs").setup()
        require("mini.surround").setup()

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

        require("mini.diff").setup({
            view = {
                style = "sign",
                signs = {
                    add = "+",
                    change = "~",
                    delete = "-",
                },
            },
        })

        require("mini.git").setup()
        vim.keymap.set({ "n", "x" }, "<Leader>gs", "<Cmd>lua MiniGit.show_at_cursor()<CR>", { desc = "Show at cursor" })

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
