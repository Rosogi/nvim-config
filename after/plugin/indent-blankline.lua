local ok, ibl = pcall(require, "ibl")
if not ok then
    return
end

ibl.setup({
    indent = {
        char = "│",
    },

    scope = {
        enabled = true,
        show_start = true,
        show_end = false,
    },

    exclude = {
        filetypes = {
            "help",
            "packer",
            "NvimTree",
            "Trouble",
            "mason",
            "lazy",
            "notify",
            "dashboard",
            "alpha",
        },
        buftypes = {
            "terminal",
            "nofile",
            "quickfix",
            "prompt",
        },
    },
})
