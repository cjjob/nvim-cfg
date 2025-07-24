return {
    {
        "stevearc/oil.nvim",
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        lazy = false,
        config = function()
            require("oil").setup({
                -- Add any oil.nvim configuration options here.
                -- Example:
                keymaps = {
                    -- your custom keymaps go here. Example:
                    -- ['<CR>'] = 'actions.select',
                },
                view_options = {
                    -- Show files and directories that start with "."
                    show_hidden = true,
                },
            })
        end,
        -- Add keymaps to open oil.nvim if desired.
        keys = {
            { "<leader>e", "<cmd>Oil<cr>", desc = "Open Oil" },
        },
    },
}