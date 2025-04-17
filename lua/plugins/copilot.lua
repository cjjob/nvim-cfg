return {
    'github/copilot.vim',
    event = 'InsertEnter', -- or "BufReadPost", or your preferred event
    config = function()
        vim.g.copilot_filetypes = {
            -- yaml = false,
            -- markdown = true,
            help = false,
            gitcommit = false,
            gitrebase = false,
            ['.'] = false,
        }

        -- Note, if on macOS, you need to disable CTRL+Left/Right/Up doing Mission Control things.
        vim.keymap.set('i', '<C-Left>', '<Plug>(copilot-dismiss)')
        vim.keymap.set('i', '<C-Right>', '<Plug>(copilot-accept-line)')
        vim.keymap.set('i', '<C-Up>', '<Plug>(copilot-next)')
        vim.keymap.set('i', '<C-Space>', '<Plug>(copilot-suggest)')
    end,
    keys = {
        { '<leader>ps', ':Copilot status<CR>', desc = 'Co[p]ilot Status' },
        { '<leader>pr', ':Copilot setup<CR>', desc = 'Co[p]ilot (re)run Setup' },
        { '<leader>pp', ':Copilot panel<CR>', desc = 'Co[p]ilot Panel' },
        { '<leader>pd', ':Copilot disable<CR>', desc = 'Co[p]ilot Disable' },
        { '<leader>pe', ':Copilot enable<CR>', desc = 'Co[p]ilot Enable' },
        { '<leader>ph', ':Copilot help<CR>', desc = 'Co[p]ilot Help' },
    },
}
