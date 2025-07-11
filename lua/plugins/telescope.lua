return -- Fuzzy Finder - files, lsp, etc.
{
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    -- They specifically advise against this.
    -- Should either use latest release tag (0.1.8 atm) or the relase branch (0.1.x).
    -- But there is a fix on master for jumplist that I want to use.
    -- TODO: Switch to 0.2.0 when released.
    branch = "master",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        {
            "nvim-telescope/telescope-ui-select.nvim",
        },
        {
            "nvim-tree/nvim-web-devicons",
            enabled = vim.g.have_nerd_font,
        },
    },
    config = function()
        -- :Telescope help_tags
        -- Two important keymaps to use while in Telescope are:
        -- - Insert mode: <c-/>
        -- - Normal mode: ?
        -- This opens a window that shows you all of the keymaps for the current
        -- Telescope picker. This is really useful to discover what Telescope can
        -- do as well as how to actually do it!
        -- :help telescope
        -- :help telescope.setup()
        require("telescope").setup({
            defaults = {
                layout_strategy = "center",
                layout_config = {
                    center = {
                        anchor = "N",
                        prompt_position = "top",
                        width = 0.85,
                    },
                },
                mappings = {
                    i = {
                        ["<C-x>"] = require("telescope.actions").delete_buffer,
                    },
                    n = {
                        ["<C-x>"] = require("telescope.actions").delete_buffer,
                    },
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
        })

        -- Enable Telescope extensions if they are installed
        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

        -- See `:help telescope.builtin`
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
        vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
        vim.keymap.set(
            "n",
            "<leader>sgc",
            builtin.git_commits,
            { desc = "[S]earch [G]it [C]ommits" }
        )
        vim.keymap.set("n", "<leader>sgs", builtin.git_status, { desc = "[S]earch [G]it [S]tatus" })
        vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
        vim.keymap.set("n", "<leader>sj", builtin.jumplist, { desc = "[S]earch [J]umplist" })
        vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
        vim.keymap.set("n", "<leader>sl", builtin.resume, { desc = "[S]earch [L]ast" })
        vim.keymap.set("n", "<leader>sr", builtin.live_grep, { desc = "[S]earch by g[R]ep" })
        vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
        vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
        vim.keymap.set("n", "<leader><leader>", function()
            builtin.buffers({
                ignore_current_buffer = true,
                sort_mru = true,
            })
        end, { desc = "Find existing buffers" })

        -- Slightly advanced example of overriding default behavior and theme
        vim.keymap.set("n", "<leader>/", function()
            -- You can pass additional configuration to Telescope to change the theme, layout, etc.
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 10,
                previewer = false,
            }))
        end, { desc = "[/] Fuzzily search in current buffer" })

        -- It's also possible to pass additional configuration options.
        --  See `:help telescope.builtin.live_grep()` for information about particular keys
        vim.keymap.set("n", "<leader>s/", function()
            builtin.live_grep({
                grep_open_files = true,
                prompt_title = "Live Grep in Open Files",
            })
        end, { desc = "[S]earch [/] in Open Files" })

        -- Shortcut for searching your Neovim configuration files
        vim.keymap.set("n", "<leader>sn", function()
            builtin.find_files({ cwd = vim.fn.stdpath("config") })
        end, { desc = "[S]earch [N]eovim files" })
    end,
}
