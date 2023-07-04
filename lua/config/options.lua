-- 
-- System
--
vim.opt.autochdir      = true
vim.opt.clipboard      = 'unnamedplus'

--
-- basic init
--
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.list           = true
vim.opt.listchars      = {tab='\\|\\', trail='·'}
vim.opt.hidden         = true
vim.opt.textwidth      = 0
vim.opt.showmode       = false
vim.opt.ttyfast        = true
-- vim.opt.lazyredraw     = false
-- instead of bell when error 
vim.opt.visualbell     = true 
vim.opt.showcmd        = true
vim.opt.wildmenu       = true
vim.opt.virtualedit    = 'block'

-- highlight current line
vim.opt.cursorline     = true

-- Use the pretty colors
vim.opt.termguicolors  = true

vim.opt.shiftround     = true
vim.opt.updatetime     = 100
vim.opt.autowrite      = true
if (vim.fn.has('termguicolors') == 1) then
    vim.opt.termguicolors = true
end

vim.opt.foldmethod     = 'indent'
vim.opt.foldlevel      = 99
vim.opt.foldenable     = false

-- local env = require('user.env')
--
-- if not env.tempdir then
--   -- Don't use temp files
--   vim.opt.swapfile = false
--   vim.opt.backup = false
-- end

-- Ignore the case when the search pattern is all lowercase
vim.opt.smartcase  = true
vim.opt.ignorecase = true

-- Keep lines below cursor when scrolling
vim.opt.scrolloff     = 5
vim.opt.sidescrolloff = 5

-- Always display signcolumn (for diagnostic related stuff)
-- vim.opt.signcolumn = 'yes'

-- When opening a window put it right or below the current one
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Enable mouse support
vim.opt.mouse = 'a'

-- Look for a tag file in the git folder
-- I shouldn't have to use `cwd` but here we are
-- vim.opt.tags:prepend(string.format('%s/.git/tags', vim.fn.getcwd()))

-- Insert mode completion setting
vim.opt.completeopt = {'menu', 'menuone', 'longest', 'noinsert', 'noselect', 'preview'}

-- Set grep default grep command with ripgrep
vim.opt.grepprg = 'rg --vimgrep --follow'
vim.opt.errorformat:append('%f:%l:%c%p%m')

--
-- tabs
--
vim.opt.autoindent    = true
vim.opt.tabstop       = 4
vim.opt.shiftwidth    = 4
vim.opt.softtabstop   = 4
vim.opt.expandtab     = true
vim.opt.autowrite     = false

-- Disable line wrapping
vim.opt.wrap          = true
-- vim.opt.formatoptions = ''
