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

        -- Set colorscheme to follow system light/dark mode.
        local theme = 'frappe'
        if vim.fn.has 'mac' == 1 then
            local appearance = vim.fn.trim(vim.fn.system 'defaults read -g AppleInterfaceStyle')
            if appearance == 'Dark' then
                theme = 'frappe'
            else
                theme = 'latte'
            end
        else
            print 'Not on macOS, using catppuccin-frappe, without following system theme.'
            print 'Linux. Did we run out of money? Windows. Are we stupid now?'
        end

        vim.cmd('colorscheme catppuccin-' .. theme)
    end,
}
