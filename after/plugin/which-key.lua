local ok, wk = pcall(require, "which-key")
if not ok then
    return
end

wk.setup({
    preset = "classic",

    delay = 100,

    icons = {
        mappings = false,
        group = "+",
        separator = "->",
    },

    win = {
        border = "rounded",
        padding = { 1, 2 },
    },

    layout = {
        spacing = 4,
        width = {
            min = 20,
        },
    },

    plugins = {
        marks = true,
        registers = true,
        spelling = {
            enabled = true,
            suggestions = 20,
        },
        presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
        },
    },
})

wk.add({
    { "<leader>f", group = "Find / Telescope" },
    { "<leader>g", group = "Git / Gitsigns" },
    { "<leader>s", group = "Splits" },
    { "<leader>n", group = "nvim-tree" },
    { "<leader>b", group = "Buffers" },
    { "<leader>r", group = "Resize" },
    { "<leader>w", group = "Windows" },
    { "<leader>y", group = "Yank / Clipboard" },
    { "<leader>p", group = "Paste / Clipboard" },
})
