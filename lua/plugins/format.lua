-- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#lazy-loading-with-lazynvim
return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        formatters_by_ft = {
            c = { "clang-format" },
            css = { "prettier" },
            go = { "gofmt" },
            html = { "prettier" },
            javascript = { "prettier" },
            json = { "prettier" },
            lua = { "stylua" },
            python = { "black", "isort" },
            rust = { "rustfmt" },
            typescript = { "prettier" },
            yaml = { "prettier" },
        },
        format_on_save = { timeout_ms = 500 },
        formatters = {
            -- stylua = {
            --     prepend_args = { "--config-path", "/Users/conor/.config/nvim/.stylua.toml" },
            -- },
        },
    },
}
