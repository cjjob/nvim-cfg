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
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        main = "nvim-treesitter.configs", -- Sets main module to use for opts
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "diff",
                "html",
                "lua",
                "luadoc",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "rust",
                "vim",
                "vimdoc",
            },
            -- Autoinstall languages that are not installed
            auto_install = true,
            highlight = {
                enable = false,
            },
            indent = { enable = true, disable = { "python" } },
        },
        {
            "nvim-treesitter/nvim-treesitter-context",
        },
        {
            "Vimjas/vim-python-pep8-indent",
        },
        {
            "MeanderingProgrammer/render-markdown.nvim",
            dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
            ---@module 'render-markdown'
            ---@type render.md.UserConfig
            opts = {},
            ft = {
                "markdown",
            },
        },
        {
            "folke/noice.nvim",
            event = "VeryLazy",
            opts = {
                -- add any options here
            },
            dependencies = {
                -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                "MunifTanjim/nui.nvim",
            },
            config = function()
                require("noice").setup({
                    lsp = {
                        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                        override = {
                            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                            ["vim.lsp.util.stylize_markdown"] = true,
                        },
                    },
                    -- you can enable a preset for easier configuration
                    presets = {
                        bottom_search = true, -- use a classic bottom cmdline for search
                        command_palette = true, -- position the cmdline and popupmenu together
                        long_message_to_split = true, -- long messages will be sent to a split
                        inc_rename = false, -- enables an input dialog for inc-rename.nvim
                        lsp_doc_border = true, -- add a border to hover docs and signature help
                    },
                    -- Show macro recording messages.
                    -- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes#show-recording-messages
                    routes = {
                        {
                            view = "notify",
                            filter = { event = "msg_showmode" },
                        },
                    },
                })
            end,
        },
    },
}
