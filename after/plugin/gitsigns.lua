local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
    return
end

gitsigns.setup({
    signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
    },

    signs_staged = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
    },

    signs_staged_enable = true,

    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,

    watch_gitdir = {
        follow_files = true,
    },

    auto_attach = true,
    attach_to_untracked = false,

    current_line_blame = false,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
    },

    preview_config = {
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
    },

    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, {
                buffer = bufnr,
                noremap = true,
                silent = true,
                desc = desc,
            })
        end

        map("n", "]g", function()
            if vim.wo.diff then
                vim.cmd.normal({ "]c", bang = true })
            else
                gs.nav_hunk("next")
            end
        end, "Next git hunk")

        map("n", "[g", function()
            if vim.wo.diff then
                vim.cmd.normal({ "[c", bang = true })
            else
                gs.nav_hunk("prev")
            end
        end, "Previous git hunk")

        -- Hunk actions
        map("n", "<leader>gp", gs.preview_hunk, "Preview git hunk")
        map("n", "<leader>gi", gs.preview_hunk_inline, "Preview git hunk inline")

        map("n", "<leader>gs", gs.stage_hunk, "Stage git hunk")
        map("n", "<leader>gr", gs.reset_hunk, "Reset git hunk")

        map("v", "<leader>gs", function()
            gs.stage_hunk({
                vim.fn.line("."),
                vim.fn.line("v"),
            })
        end, "Stage selected git hunk")

        map("v", "<leader>gr", function()
            gs.reset_hunk({
                vim.fn.line("."),
                vim.fn.line("v"),
            })
        end, "Reset selected git hunk")

        -- Buffer actions
        map("n", "<leader>gS", gs.stage_buffer, "Stage whole buffer")
        map("n", "<leader>gR", gs.reset_buffer, "Reset whole buffer")

        -- Blame
        map("n", "<leader>gb", function()
            gs.blame_line({ full = true })
        end, "Git blame line")

        map("n", "<leader>gtb", gs.toggle_current_line_blame, "Toggle git blame line")

        -- Diff
        map("n", "<leader>gd", gs.diffthis, "Git diff current file")

        map("n", "<leader>gD", function()
            gs.diffthis("~")
        end, "Git diff current file against previous commit")

        map("n", "<leader>gtw", gs.toggle_word_diff, "Toggle git word diff")

        -- Text object
        map({ "o", "x" }, "ih", gs.select_hunk, "Select git hunk")
    end,
})
