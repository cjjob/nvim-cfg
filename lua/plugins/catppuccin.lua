return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
        require('catppuccin').setup {
            integrations = {
                -- https://github.com/catppuccin/nvim?tab=readme-ov-file#integrations
                noice = true,
                notify = true,
                which_key = true,
            },
        }

        vim.cmd.colorscheme 'catppuccin-frappe'
    end,
}
