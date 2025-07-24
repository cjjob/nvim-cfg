return {
    "echasnovski/mini.nvim",
    version = false,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        -- https://github.com/echasnovski/mini.nvim/blob/4e873f36552ac7c15a824f36783c629493f78d0c/doc/mini-ai.txt#L715
        local spec_treesitter = require("mini.ai").gen_spec.treesitter
        require("mini.ai").setup({
            n_lines = 500,
        })

        require("mini.surround").setup()

        require("mini.jump2d").setup({
            mappings = {
                start_jumping = "j",
            },
        })

        require("mini.starter").setup()
        require("mini.sessions").setup({
            directory = vim.fn.expand("~/workspace/nvim_sessions/"),
            vim.keymap.set("n", "<leader>mss", function()
                local sname = vim.fn.input("Session name: ")
                -- TODO: Detect not overwriting existing sessions.
                if sname == "" then
                    vim.notify("Session name cannot be empty! Aborting.")
                    return
                end
                MiniSessions.write(sname)
            end),
            vim.keymap.set("n", "<leader>msd", function()
                local sname = vim.fn.input("Session name: ")
                if sname == "" then
                    vim.notify("Session name cannot be empty! Aborting.")
                    return
                end
                MiniSessions.delete(sname)
            end),
        })
    end,
}
