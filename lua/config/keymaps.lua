local km = vim.keymap

km.set("n", "<left>", "<left>zz")
km.set("n", "<right>", "<right>zz")
km.set("n", "<up>", "<up>zz")
km.set("n", "<down>", "<down>zz")

-- Navigation.
km.set("n", "<leader><left>", "<C-w>h", { desc = "move window left" })
km.set("n", "<leader><right>", "<C-w>l", { desc = "move window left" })
km.set("n", "<leader><up>", "<C-w>k", { desc = "move window left" })
km.set("n", "<leader><down>", "<C-w>j", { desc = "move window left" })
km.set({ "n", "v" }, "k", "<C-u>zz", { desc = "0.5 page up" })
km.set({ "n", "v" }, "l", "<C-d>zz", { desc = "0.5 page down" })
km.set("n", "<C-,>", "<C-o>zz", { desc = "Jump back" })
km.set("n", "<C-.>", "<C-i>zz", { desc = "Jump forward" })

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

km.set("n", "<leader>ks", function()
    if vim.g.syntax_on then
        vim.cmd("syntax off")
    else
        vim.cmd("syntax on")
    end
end, { desc = "syntax on/off" })
