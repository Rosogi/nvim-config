local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
    return
end

vim.opt.termguicolors = true

local function on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
        }
    end

    api.map.on_attach.default(bufnr)

    vim.keymap.set("n", "s", api.node.open.vertical, opts("Open: Vertical Split"))
    vim.keymap.set("n", "i", api.node.open.horizontal, opts("Open: Horizontal Split"))

    vim.keymap.set("n", "S", api.node.run.system, opts("Run System"))
end

nvim_tree.setup({
    on_attach = on_attach,
	sort = {
        sorter = "case_sensitive",
    },

    view = {
        width = 35,
        side = "left",
        preserve_window_proportions = true,
    },

    renderer = {
        group_empty = true,

        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
        },
    },

    filters = {
        dotfiles = false,
        git_ignored = false,
    },

    git = {
        enable = true,
        ignore = false,
    },

    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },

    update_focused_file = {
        enable = true,
        update_root = false,
    },

    actions = {
        open_file = {
            quit_on_open = false,
            resize_window = true,
        },
    },
})

vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", {
    noremap = true,
    silent = true,
    desc = "Toggle nvim-tree",
})

vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>", {
    noremap = true,
    silent = true,
    desc = "Find current file in nvim-tree",
})

vim.keymap.set("n", "<leader>nr", ":NvimTreeRefresh<CR>", {
    noremap = true,
    silent = true,
    desc = "Refresh nvim-tree",
})

vim.keymap.set("n", "<leader>nc", ":NvimTreeCollapse<CR>", {
    noremap = true,
    silent = true,
    desc = "Collapse nvim-tree",
})
