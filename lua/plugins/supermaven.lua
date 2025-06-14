return {
    "supermaven-inc/supermaven-nvim",
    config = function()
        require("supermaven-nvim").setup({
            keymaps = {
                accept_suggestion = "<C-Right>",
                clear_suggestion = "<C-Left>",
                accept_word = "<C-Up>",
            },
        })
    end,
    keys = {
        { "<leader>cs", ":SupermavenStart<CR>", desc = "[C]opilot Start" },
        { "<leader>cr", ":SupermavenRestart<CR>", desc = "[C]opilot Restart" },
        { "<leader>cd", ":SupermavenStop<CR>", desc = "[C]opilot Disable" },
        { "<leader>cuf", ":SupermavenUseFree<CR>", desc = "[C]opilot Free" },
        { "<leader>cup", ":SupermavenUsePro<CR>", desc = "[C]opilot Pro" },
        { "<leader>cls", ":SupermavenShowLog<CR>", desc = "[C]opilot Show Log" },
        { "<leader>clc", ":SupermavenClearLog<CR>", desc = "[C]opilot Clear Log" },
        { "<leader>ct", ":SupermavenToggle<CR>", desc = "[C]opilot Toggle" },
        { "<leader>cu", ":SupermavenStatus<CR>", desc = "[C]opilot Status" },
    },
}
