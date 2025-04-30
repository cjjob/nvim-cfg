-- :help lua-guide
-- :help
-- <space>sh to [s]earch the [h]elp documentation.
-- If you experience any errors while trying to install kickstart, run
-- :checkhealth for more info.

-- Install `lazy.nvim` plugin manager.
-- :help lazy.nvim.txt`
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        error("Error cloning lazy.nvim:\n" .. out)
    end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Load in this order is safest.
-- Be careful if you create a keymap that depends on an autocommand.
require("options")
require("keymaps")
require("autocommands")

require("lazy").setup({

    -- For plugins requiring no configuration, add repo link directly.
    "Bekaboo/deadcolumn.nvim",
    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically.

    -- For more involved plugins, take a modular approach.
    require("plugins/autocompletion"),
    require("plugins/catppuccin"),
    require("plugins/codecompanion"),
    -- require 'plugins/colorscheme',
    require("plugins/conform"),
    require("plugins/copilot"),
    require("plugins/flash"),
    require("plugins/gitsigns"),
    require("plugins/lsp"),
    require("plugins/mini"),
    require("plugins/noice"),
    require("plugins/nvim-dap"),
    require("plugins/oil"),
    require("plugins/precognition"),
    require("plugins/python-indent"),
    require("plugins/render-markdown"),
    require("plugins/telescope"),
    require("plugins/todo-comments"),
    require("plugins/toggleterm"),
    require("plugins/nvim-treesitter"),
    require("plugins/which-key"),
}, {
    ui = {
        -- If you are using a Nerd Font: set icons to an empty table which will use the
        -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
        icons = vim.g.have_nerd_font and {} or {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            task = "📌",
            lazy = "💤 ",
        },
    },
})
