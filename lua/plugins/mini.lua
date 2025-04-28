return { -- Collection of various small independent plugins/modules
    "echasnovski/mini.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
        -- Better Around/Inside textobjects
        --
        -- Examples:
        --  - va)  - [V]isually select [A]round [)]paren
        --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
        --  - ci'  - [C]hange [I]nside [']quote
        -- https://github.com/echasnovski/mini.nvim/blob/4e873f36552ac7c15a824f36783c629493f78d0c/doc/mini-ai.txt#L715
        local spec_treesitter = require("mini.ai").gen_spec.treesitter
        require("mini.ai").setup({
            n_lines = 500,
            custom_textobjects = {
                -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects?tab=readme-ov-file#built-in-textobjects

                -- Collides with brackets.
                -- b = spec_treesitter { a = '@block.outer', i = '@block.inner' },
                c = spec_treesitter({ a = "@comment.outer", i = "@comment.inner" }),
                f = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
                i = spec_treesitter({ a = "@conditional.outer", i = "@conditional.inner" }),
                l = spec_treesitter({ a = "@loop.outer", i = "@loop.inner" }),
                m = spec_treesitter({ a = "@method.outer", i = "@method.inner" }),
                p = spec_treesitter({ a = "@parameter.outer", i = "@parameter.inner" }),
                s = spec_treesitter({ a = "@statement.outer", i = "@statement.inner" }),
            },
        })

        -- TODO: Find different keymap. I'm using "s" for search with noice.
        -- Add/delete/replace surroundings (brackets, quotes, etc.)
        --
        -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
        -- - sd'   - [S]urround [D]elete [']quotes
        -- - sr)'  - [S]urround [R]eplace [)] [']
        require("mini.surround").setup()

        -- Simple and easy statusline.
        --  You could remove this setup call if you don't like it,
        --  and try some other statusline plugin
        local statusline = require("mini.statusline")
        -- set use_icons to true if you have a Nerd Font
        statusline.setup({ use_icons = vim.g.have_nerd_font })

        -- You can configure sections in the statusline by overriding their
        -- default behavior. For example, here we set the section for
        -- cursor location to LINE:COLUMN
        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.section_location = function()
            return "%2l:%-2v"
        end

        -- ... and there is more!
        --  Check out: https://github.com/echasnovski/mini.nvim
    end,
}
