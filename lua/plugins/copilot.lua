return {
    "github/copilot.vim",
    event = "InsertEnter", -- or "BufReadPost", or your preferred event
    config = function()
        vim.g.copilot_filetypes = {
            -- yaml = false,
            -- markdown = true,
            help = false,
            gitcommit = false,
            gitrebase = false,
            ["."] = false,
        }

        -- Accept entire completion with F13.
        -- i.e. Don't accept entire completions. Write your own code.
        -- Spam Ctrl+Right to go line by line if you must.
        vim.keymap.set("i", "<F13>", "copilot#Accept(\"\")", {
            expr = true,
            replace_keycodes = false,
        })
        vim.g.copilot_no_tab_map = true
        -- Note, if on macOS, you need to disable CTRL+Left/Right/Up doing Mission Control things.
        vim.keymap.set("i", "<C-Left>", "<Plug>(copilot-dismiss)")
        vim.keymap.set("i", "<C-Right>", "<Plug>(copilot-accept-line)")
        vim.keymap.set("i", "<C-Up>", "<Plug>(copilot-next)")
        vim.keymap.set("i", "<C-Space>", "<Plug>(copilot-suggest)")
    end,
    keys = {
        { "<leader>cs", ":Copilot status<CR>", desc = "[C]opilot Status" },
        { "<leader>cr", ":Copilot setup<CR>", desc = "[C]opilot (re)run Setup" },
        { "<leader>cp", ":Copilot panel<CR>", desc = "[C]opilot Panel" },
        { "<leader>cd", ":Copilot disable<CR>", desc = "[C]opilot Disable" },
        { "<leader>ce", ":Copilot enable<CR>", desc = "[C]opilot Enable" },
        { "<leader>ch", ":Copilot help<CR>", desc = "[C]opilot Help" },
    },
}
