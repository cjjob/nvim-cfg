-- Vim globals.
-- They are truly global.
-- Can create your own.
-- :help mapleader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- Vim options.
-- These are sort of global. I don't fully get it.
-- Can't create your own.
-- :help vim.opt
-- :help option-list
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
-- (1) :help clipboard (2) :help 'clipboard'
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)
vim.opt.breakindent = true -- Indents continue on wrapped lines.
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true -- Override `ignorecase` if there are capital letters in the search term.
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true -- Show which line your cursor is on.
vim.opt.scrolloff = 10
