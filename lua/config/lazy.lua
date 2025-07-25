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
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = false
vim.opt.signcolumn = "no"
vim.opt.laststatus = 0 -- Turn off statusline.
vim.opt.ruler = false
vim.opt.clipboard = "unnamedplus"
vim.opt.showmode = false
vim.opt.scrolloff = 8
vim.opt.fillchars = { eob = " " }

-- Show whitespace characters
vim.opt.list = true
vim.opt.listchars = {
  tab = "»·",
  trail = "·",
  extends = "…",
  precedes = "…",
  nbsp = "␣",
}

vim.cmd("colorscheme minimal")
require("config.keymaps")
require("config.autocommands")

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    install = { colorscheme = { "minimal" } },
    checker = { enabled = false },
})
