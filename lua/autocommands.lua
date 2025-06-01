-- :help lua-guide-autocommands
-- Highlight when yanking (copying) text
-- Try it with `yap` in normal mode
-- :help vim.highlight.on_yank()
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Colorcolumns (cc), commonly called "ruler"s.
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "go", "lua" },
    callback = function()
        vim.opt_local.colorcolumn = "101"
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python" },
    callback = function()
        vim.opt_local.colorcolumn = "88"
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "rust" },
    callback = function()
        vim.opt_local.colorcolumn = "81, 101"
    end,
})
