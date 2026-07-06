vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Window resizing by arrows
vim.keymap.set("n", "<M-Left>", ":vertical resize -5<CR>", {
    noremap = true,
    silent = true,
    desc = "Decrease window width",
})
vim.keymap.set("n", "<M-Right>", ":vertical resize +5<CR>", {
    noremap = true,
    silent = true,
    desc = "Increase window width",
})
vim.keymap.set("n", "<M-Up>", ":resize +3<CR>", {
    noremap = true,
    silent = true,
    desc = "Increase window height",
})
vim.keymap.set("n", "<M-Down>", ":resize -3<CR>", {
    noremap = true,
    silent = true,
    desc = "Decrease window height",
})

-- Equalize windows
vim.keymap.set("n", "<leader>=", "<C-w>=", {
    noremap = true,
    silent = true,
    desc = "Equalize window sizes",
})
