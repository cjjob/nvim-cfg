return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
        hide_numbers = false,
        highlights = {
            NormalFloat = { guibg = "#000000" },
            FloatBorder = {
                guibg = "#000000",
                guifg = "#00ff00", -- The border.
            },
        },
        float_opts = {
            border = "single",
        },
    },
}
