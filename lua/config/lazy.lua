-- Bootstrap lazy.nvim
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
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Options.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.have_nerd_font = true
vim.opt.breakindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = false
vim.opt.expandtab = true
vim.opt.fillchars = { eob = " " }
vim.opt.ignorecase = true
vim.opt.laststatus = 0 -- Turn off statusline.
vim.opt.list = true
vim.opt.listchars = {
    extends = ">",
    nbsp = "␣",
    precedes = "<",
    tab = "» ",
    trail = "·",
}
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = false
vim.opt.scrolloff = 999 -- Centers active line.
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.signcolumn = "no"
vim.opt.smartcase = true -- Override `ignorecase` if there are capital letters in the search term.
vim.opt.tabstop = 4

require("config.autocommands")
require("config.keymaps")
vim.cmd("colorscheme minimal")

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    install = { colorscheme = { "minimal" } },
    checker = { enabled = false },
})
