return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bufdelete = { enabled = true },
        lazygit = { enabled = true },
        notifier = { enabled = true },
        picker = {
            enabled = true,
            sources = { files = { hidden = true } },
        },
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

        -- picker
        {
            "<leader>sb",
            function()
                Snacks.picker.buffers()
            end,
            desc = "Buffers",
        },
        {
            "<leader>sd",
            function()
                Snacks.picker.diagnostics()
            end,
            desc = "Diagnostics",
        },
        {
            "<leader>sf",
            function()
                Snacks.picker.files()
            end,
            desc = "Files",
        },
        {
            "<leader>sgb",
            function()
                Snacks.picker.git_branches()
            end,
            desc = "Git Branches",
        },
        {
            "<leader>sgd",
            function()
                Snacks.picker.git_diff()
            end,
            desc = "Git Diff",
        },
        {
            "<leader>sgf",
            function()
                Snacks.picker.git_files()
            end,
            desc = "Git Files",
        },
        {
            "<leader>sgl",
            function()
                Snacks.picker.git_log()
            end,
            desc = "Git Log",
        },
        {
            "<leader>sgs",
            function()
                Snacks.picker.git_status()
            end,
            desc = "Git Status",
        },
        {
            "<leader>sj",
            function()
                Snacks.picker.jumps()
            end,
            desc = "Jumps",
        },
        {
            "<leader>sn",
            function()
                Snacks.picker.notifications()
            end,
            desc = "Notifications",
        },
        {
            "<leader><leader>",
            function()
                Snacks.picker.grep()
            end,
            desc = "[R]egex",
        },
        {
            "<leader>ss",
            function()
                Snacks.picker.pickers()
            end,
            desc = "[S]elect Picker",
        },

        -- terminal
        {
            -- Set F15 to toggle float terminal.
            -- NOTE: Only makes sense because remapped CAPSLOCK + # to F15.
            mode = { "i", "n", "t" },
            "<F15>",
            function()
                Snacks.terminal()
            end,
            desc = "Toggle terminal",
        },
    },
}
