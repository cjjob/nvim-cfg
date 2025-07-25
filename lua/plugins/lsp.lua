return {
    -- 1. Mason: Manages and installs LSP servers, linters, formatters, etc.
    {
        "mason-org/mason.nvim",
        cmd = "Mason", -- Lazy-load Mason when the 'Mason' command is used.
        config = function()
            require("mason").setup()
        end,
    },

    -- 2. nvim-lspconfig: Official Neovim LSP configuration.
    --    It depends on Mason to provide the actual language servers.
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mason-org/mason.nvim" }, -- Ensure Mason is available
    },

    -- 3. blink.cmp: Completion plugin.
    --    It integrates with LSP for intelligent completion suggestions.
    --    Placed here for human readability, as LSP setup might use its capabilities.
    {
        "saghen/blink.cmp",
        version = "1.*",
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = { preset = "super-tab" },
            -- You might need to explicitly enable or configure how blink.cmp displays diagnostics here
            -- if its default behavior isn't what you want or if it's not picking up the LSP diagnostics.
            -- Consult blink.cmp's documentation for its diagnostic options.
        },
        config = function(_, opts)
            -- Initialize blink.cmp with your specified options
            require("blink.cmp").setup(opts)
        end,
    },

    -- 4. mason-lspconfig.nvim: Bridges Mason's installed servers with nvim-lspconfig.
    --    It simplifies the setup by auto-configuring servers installed via Mason.
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim", -- Requires Mason to manage servers
            "neovim/nvim-lspconfig", -- Requires nvim-lspconfig for LSP client integration
        },
        config = function()
            local lspconfig = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")

            -- Define client (Neovim) capabilities.
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local ok_blink, blink_cmp = pcall(require, "blink.cmp")
            if ok_blink and blink_cmp.get_lsp_capabilities then
                -- If blink.cmp is available, use its LSP capabilities.
                -- This extends the capabilities above.
                capabilities = blink_cmp.get_lsp_capabilities()
            end

            -- on_attach function: Called when an LSP server attaches to a buffer.
            -- This is the place to set up buffer-local keymaps for LSP features.
            local function on_attach(client, bufnr)
                -- Default options for keymaps set in this buffer.
                -- 'noremap = true' means the mapping will not be recursively remapped.
                -- 'silent = true' means the mapping will not show a command message when triggered.
                local opts = { noremap = true, silent = true }

                -- Go to definition
                vim.keymap.set(
                    "n",
                    "gd",
                    vim.lsp.buf.definition,
                    vim.tbl_extend("force", opts, { desc = "Go to definition" })
                )
                -- Go to type definition
                vim.keymap.set(
                    "n",
                    "gD",
                    vim.lsp.buf.type_definition,
                    vim.tbl_extend("force", opts, { desc = "Go to type definition" })
                )
                -- Go to declarations
                -- vim.keymap.set("n", "gds", vim.lsp.buf.declaration, opts)
                -- Go to implementations
                vim.keymap.set(
                    "n",
                    "gi",
                    vim.lsp.buf.implementation,
                    vim.tbl_extend("force", opts, { desc = "Go to implementation" })
                )
                -- Go to references
                vim.keymap.set(
                    "n",
                    "gr",
                    vim.lsp.buf.references,
                    vim.tbl_extend("force", opts, { desc = "Go to references" })
                )
                -- Hover documentation
                vim.keymap.set(
                    "n",
                    "K",
                    vim.lsp.buf.hover,
                    vim.tbl_extend("force", opts, { desc = "Hover documentation" })
                )
                -- Signature help
                vim.keymap.set(
                    "n",
                    "<C-k>",
                    vim.lsp.buf.signature_help,
                    vim.tbl_extend("force", opts, { desc = "Signature help" })
                )
                -- Rename symbol
                vim.keymap.set(
                    "n",
                    "<leader>rn",
                    vim.lsp.buf.rename,
                    vim.tbl_extend("force", opts, { desc = "Rename symbol" })
                )
                -- Code actions
                vim.keymap.set(
                    "n",
                    "<leader>ca",
                    vim.lsp.buf.code_action,
                    vim.tbl_extend("force", opts, { desc = "Code actions" })
                )

                -- Disable formatting for lua_ls to avoid conflicts with conform.nvim/stylua
                if client.name == "lua_ls" then
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false
                end

                -- Optional: Format on save if the server supports it
                if client.server_capabilities.documentFormattingProvider then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = vim.api.nvim_create_augroup(
                            "LspFormatting" .. bufnr,
                            { clear = true }
                        ),
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                    })
                end
            end

            -- Diagnostics configuration: How Neovim displays errors, warnings, etc.
            vim.diagnostic.config({
                virtual_text = true, -- Set to false to avoid double inline warnings if blink.cmp provides them
                signs = true, -- Show signs in the sign column
                underline = true, -- Underline code with diagnostics
                update_in_insert = false, -- Don't update diagnostics while in insert mode
                severity_sort = true, -- Sort diagnostics by severity (errors first)
                float = { border = "rounded" }, -- Rounded border for diagnostic float window
            })

            -- Handler borders: Configure floating window borders for specific LSP features.
            local handlers = {
                ["textDocument/hover"] = vim.lsp.with(
                    vim.lsp.handlers.hover,
                    { border = "rounded" }
                ),
                ["textDocument/signatureHelp"] = vim.lsp.with(
                    vim.lsp.handlers.signature_help,
                    { border = "rounded" }
                ),
            }

            -- Per-server settings: Custom configurations for individual language servers.
            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "Snacks", "vim" },
                            },
                            telemetry = { enable = false }, -- Disable telemetry
                            workspace = { checkThirdParty = false }, -- Don't check external Lua dependencies
                        },
                    },
                },
                -- Add more servers and their specific settings here.
                -- For example:
                -- python_ls = {
                --     settings = {
                --         pylsp = {
                --             plugins = {
                --                 autopep8 = { enabled = true },
                --                 flake8 = { enabled = true },
                --             },
                --         },
                --     },
                -- },
            }

            -- Setup Mason LSPConfig: Ensures specified LSP servers are installed and managed.
            mason_lspconfig.setup({
                ensure_installed = {
                    "cssls",
                    "html",
                    "gopls",
                    "lua_ls",
                    "pyright",
                    "rust_analyzer",
                    "ts_ls",
                },
                automatic_enable = false,
            })

            -- Loop through installed servers and set them up with nvim-lspconfig.
            -- This dynamically applies shared settings (on_attach, capabilities, handlers)
            -- and merges in any server-specific settings defined above.
            for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
                lspconfig[server_name].setup(vim.tbl_deep_extend("force", {
                    on_attach = on_attach,
                    capabilities = capabilities,
                    handlers = handlers,
                }, servers[server_name] or {}))
            end
        end,
    },
}

