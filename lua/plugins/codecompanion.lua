return {
    "olimorris/codecompanion.nvim",
    opts = {},
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    keys = {
        { "<leader>pa", ":CodeCompanionActions<CR>", desc = "Code Com[p]anion [A]ctions" },
        { "<leader>pc", ":CodeCompanionChat<CR>", desc = "Code Com[p]anion [C]hat" },
        {
            "<leader>pp",
            function()
                vim.ui.input({ prompt = "Code Companion: " }, function(input)
                    if input then
                        vim.cmd(":CodeCompanion " .. input .. " <CR>")
                    else
                        vim.notify("No input provided", vim.log.levels.WARN)
                    end
                end)
            end,
            desc = "Code Com[p]anion with [P]rompt",
        },
    },
}
