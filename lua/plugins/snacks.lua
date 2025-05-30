    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        terminal = { enabled = true },
    },
    keys = {
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
