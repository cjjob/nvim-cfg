local km = vim.keymap -- For brevity

-- :help vim.keymap.set()
-- :help hlsearch
km.set(
    "n",
    "<Esc>", -- Clear highlights on search with <Esc> in normal mode.
    "<cmd>nohlsearch<CR>"
)
km.set(
    "n",
    "<leader>q", -- Diagnostics.
    vim.diagnostic.setloclist,
    { desc = "Open diagnostic [Q]uickfix list" }
)
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit
-- easier for people to discover. Otherwise, you normally need to press
-- <C-\><C-n>, which is not what someone will guess without a bit more
-- experience.
-- NOTE: This won't work in all terminal emulators/tmux/etc.
km.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Move between windows with <leader> + (remapped) arrow keys.
km.set("n", "<leader><Left>", "<C-w>h", { desc = "Move to left window" })
km.set("n", "<leader><Right>", "<C-w>l", { desc = "Move to right window" })
km.set("n", "<leader><Up>", "<C-w>k", { desc = "Move to above window" })
km.set("n", "<leader><Down>", "<C-w>j", { desc = "Move to below window" })

-- jl for 'big moves' (since I use caps+ijkl as arrows).
km.set("n", "j", "<C-u>", { desc = "Move half page up" })
km.set("n", "l", "<C-d>", { desc = "Move half page down" })

-- ctrl + ,/. to navigate jumplist (entries in `:jumps`).
-- :help jump-motions.
-- I think next/previous entry in jumplist are kind of reverse of
-- back/forward intutively (in time).
km.set("n", "<C-,>", "<C-o>", { desc = "Jump \"back\"" })
km.set("n", "<C-.>", "<C-i>", { desc = "Jump \"forward\"" })

-- <leader>k + <key> for some common actions.
km.set("n", "<leader>ka", "ggVG", { desc = "Visual all" })
-- km.set("n", "<leader>kr", function()
--     local cc = vim.fn.input("Set colorcolumn to: ")
--     if cc ~= "" then
--         vim.opt.colorcolumn = cc
--     else
--         vim.opt.colorcolumn = "" -- Toggle off.
--     end
-- end, { desc = "Set colorcolumn (\"ruler\")" })
km.set("n", "<leader>ks", function()
    if vim.g.syntax_on then
        vim.cmd("syntax off")
    else
        vim.cmd("syntax on")
    end
end, { desc = "Toggle syntax highlighting" })
