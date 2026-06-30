vim.keymap.set("n", "<leader>n", ":NERDTreeToggle<CR>", {
    noremap = true,
    silent = true,
    desc = "Toggle NERDTree",
})

vim.keymap.set("n", "<leader>nf", ":NERDTreeFind<CR>", {
    noremap = true,
    silent = true,
    desc = "Find current file in NERDTree",
})

vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeDirArrows = 1
