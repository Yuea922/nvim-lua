--
-- Lazy.nvim
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    print('Installing lazy.nvim ...')
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
    print('Done.')
end
vim.opt.rtp:prepend(lazypath)

local opts = {
    -- install = {
    --     colorscheme = { "tokyonight" },
    -- },
    ui = {
        border = "rounded",
    },
    -- defaults = {
    --     lazy = true,
    -- },
    performance = {
        rtp = {
            disabled_plugins = {
                "matchit",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "gzip",
                "zipPlugin",
            },
        },
    },
}

require('lazy').setup('plugins', opts)
