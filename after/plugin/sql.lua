vim.g.omni_sql_no_default_maps = 1

local sql_group = vim.api.nvim_create_augroup("RosogiSqlFiletypes", {
    clear = true,
})

local function set_sql_dialect(dialect)
    vim.bo.filetype = "sql"

    vim.schedule(function()
        pcall(vim.cmd, "SQLSetType " .. dialect)
    end)
end

-- Oracle PL/SQL
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = sql_group,
    pattern = {
        "*.pks",
        "*.pkb",
        "*.pls",
        "*.plsql",
        "*.prc",
        "*.fnc",
        "*.trg",
	"*.pck"
    },
    callback = function()
        set_sql_dialect("sqloracle")
    end,
})

-- PostgreSQL
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = sql_group,
    pattern = {
        "*.pgsql",
        "*.psql",
    },
    callback = function()
        set_sql_dialect("pgsql")
    end,
})
