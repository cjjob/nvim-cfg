return {
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'nvim-neotest/nvim-nio',
            'rcarriga/nvim-dap-ui',
            'mfussenegger/nvim-dap-python',
            'theHamsta/nvim-dap-virtual-text',
        },
        config = function()
            local dap = require 'dap'
            local dapui = require 'dapui'
            local dap_python = require 'dap-python'

            require('dapui').setup {}
            require('nvim-dap-virtual-text').setup {
                commented = true, -- Show virtual text alongside comment
            }

            dap_python.setup 'python3'

            vim.fn.sign_define('DapBreakpoint', {
                text = '',
                texthl = 'DiagnosticSignError',
                linehl = '',
                numhl = '',
            })

            vim.fn.sign_define('DapBreakpointRejected', {
                text = '', -- or "❌"
                texthl = 'DiagnosticSignError',
                linehl = '',
                numhl = '',
            })

            vim.fn.sign_define('DapStopped', {
                text = '', -- or "→"
                texthl = 'DiagnosticSignWarn',
                linehl = 'Visual',
                numhl = 'DiagnosticSignWarn',
            })

            -- Automatically open/close DAP UI
            dap.listeners.after.event_initialized['dapui_config'] = function()
                dapui.open()
            end

            -- Provide a description of the keymap.
            -- Return a table with that description plus default options.
            local function km_opts(desc)
                opts = { noremap = true, silent = true }
                if desc then
                    opts.desc = desc
                end
                return opts
            end

            -- Toggle breakpoint
            vim.keymap.set('n', '<leader>bb', function()
                dap.toggle_breakpoint()
            end, km_opts 'Toggle [B]reakpoint')

            -- Continue / Start
            vim.keymap.set('n', '<leader>bc', function()
                dap.continue()
            end, km_opts '[C]ontinue / Start')

            -- Step Over
            vim.keymap.set('n', '<leader>bo', function()
                dap.step_over()
            end, km_opts 'Step [O]ver')

            -- Step Into
            vim.keymap.set('n', '<leader>bi', function()
                dap.step_into()
            end, km_opts 'Step [I]nto')

            -- Step Out
            vim.keymap.set('n', '<leader>bt', function()
                dap.step_out()
            end, km_opts 'Step ou[T]')

            -- Keymap to terminate debugging
            vim.keymap.set('n', '<leader>bq', function()
                require('dap').terminate()
            end, km_opts '[Q]uit')

            -- Toggle DAP UI
            vim.keymap.set('n', '<leader>bu', function()
                dapui.toggle()
            end, km_opts 'Toggle DAP [U]I')
        end,
    },
}
