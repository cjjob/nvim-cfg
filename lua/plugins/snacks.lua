return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bufdelete = { enabled = true },
        dim = { enabled = true },
        indent = { enabled = true },
        lazygit = { enabled = true },
        terminal = { enabled = true },
    },
    keys = {

        -- bufdelete
        {
            mode = "n",
            "<leader>kd",
            function()
                Snacks.bufdelete.other()
            end,
            desc = "Delete all other buffers",
        },

        -- lazygit
        {
            -- You can exit by double esc'ing into normal mode and using the shortcut.
            -- But, easier to just press q and exit process as with normal lazygit.
            mode = "n",
            "<leader>kl",
            function()
                Snacks.lazygit()
            end,
            desc = "Open lazygit",
        },

        -- terminal
        {
            -- Set F15 to toggle float terminal.
            -- NOTE:This only makes sense because I've remapped CAPSLOCK + # to F15.
            mode = { "i", "n", "t" },
            "<F15>",
            function()
                Snacks.terminal()
            end,
            desc = "Toggle terminal",
        },
    },
}
