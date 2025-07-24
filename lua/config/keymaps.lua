local km = vim.keymap

-- Navigation.
km.set("n", "<leader><left>", "<C-w>h", { desc = "move window left" })
km.set("n", "<leader><right>", "<C-w>l", { desc = "move window left" })
km.set("n", "<leader><up>", "<C-w>k", { desc = "move window left" })
km.set("n", "<leader><down>", "<C-w>j", { desc = "move window left" })
km.set("n", "j", "<C-u>", { desc = "0.5 page up" })
km.set("n", "k", "<C-d>", { desc = "0.5 page down" })

-- Some kommon kustom kommands.
km.set("n", "<leader>ka", "ggVG", { desc = "Visual all" })

km.set("n", "<leader>kh", function()
    vim.cmd("highlight")
end, { desc = "highlight" })

km.set("n", "<leader>kii", function()
    vim.cmd("Inspect")
end, { desc = "Inspect" })

km.set("n", "<leader>kit", function()
    vim.cmd("InspectTree")
end, { desc = "InspectTree" })

km.set("n", "<leader>kn", ":NoNeckPain<CR>", { desc = "NoNeckPain" })

km.set("n", "<leader>ks", function()
    if vim.g.syntax_on then
        vim.cmd("syntax off")
    else
        vim.cmd("syntax on")
    end
end, { desc = "syntax on/off" })
