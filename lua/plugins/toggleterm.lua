return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        local colors_day = { guibg = "#ffffff", bg = "#ffffff", fg = "#00ff00" }
        local colors_night = { guibg = "#000000", bg = "#000000", fg = "#00ff00" }
        local float_border_colors = colors_night -- Default to dark mode.

        if vim.fn.has("mac") == 1 then
            local appearance = vim.fn.trim(vim.fn.system("defaults read -g AppleInterfaceStyle"))
            if appearance == "Dark" then
                float_border_colors = colors_night
            else
                float_border_colors = colors_day
            end
        else
            print("Not on macOS, toggling terminal without following system theme.")
            print("Linux. Did we run out of money? Windows. Are we stupid now?")
        end

        require("toggleterm").setup({
            hide_numbers = false,
            highlights = {
                NormalFloat = {
                    guibg = float_border_colors.guibg, -- Terminal background.
                },
                FloatBorder = {
                    guibg = float_border_colors.bg, -- Thicker outer border.
                    guifg = float_border_colors.fg, -- Thin border line.
                },
            },
            float_opts = {
                border = "single",
            },
            shell = "zsh -l", -- Launch zsh as login shell. Ensures config is loaded.
        })
    end,
}
