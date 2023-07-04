vim.g.mapleader = ' '

-- Copy
vim.keymap.set('n', 'Y', 'y$')
vim.keymap.set('v', 'Y', '"+y')

-- Search
vim.keymap.set('', '<leader><cr>', ':nohlsearch<cr>')
vim.keymap.set('', '-', 'N')
vim.keymap.set('', '=', 'n')

-- Indentation
vim.keymap.set('n', '<', '<<')
vim.keymap.set('n', '>', '>>')

-- Folding
vim.keymap.set('', '<leader>o', 'za', {silent = true, desc = 'folding'})

-- Find and replace
vim.keymap.set('n', '\\s', ':%s//g<left><left>')

-- Delete find pair
vim.keymap.set('n', 'dy', 'd%')

-- Adjacent duplicate words
vim.keymap.set('n', '<leader>dw', '/\\(\\<\\w\\+\\>\\)\\_s*\\1')

-- Space to Tab
vim.keymap.set('n', '<leader>tt', ':%s/    /\\t/g')
vim.keymap.set('v', '<leader>tt', ':s/    /\\t/g')

-- Terminal window
vim.keymap.set('n', '<leader>/', ':set splitright<cr>:vsplit<cr>:vertical resize +10<cr>:term<cr>')
vim.keymap.set('n', '<C-n>', ':tabe<cr>:-tabmove<cr>:term lazynpm<cr>')

-- Cursor movement
--     ^
--     k
-- < h   l >
--     j
--     v
vim.keymap.set('n', '\\v', 'v$h', {silent = true, desc = 'visual go to the end of the line'})
vim.keymap.set('', 'K', '5k', {silent = true})
vim.keymap.set('', 'J', '5j', {silent = true})
vim.keymap.set('', 'N', '0', {silent = true, desc = 'go to the start of the line'})
vim.keymap.set('', 'M', '$', {silent = true, desc = 'go to the end of the line'})
vim.keymap.set('', 'W', '5w', {desc = 'inline navigation backward'})
-- Ctrl + K or J will move up/down the view port without moving the cursor
vim.keymap.set('', 'B', '5b', {desc = 'inline navigation forward'})
vim.keymap.set('', '<C-K>', '5<C-y>')
vim.keymap.set('', '<C-J>', '5<C-e>')

-- Insert mode
vim.keymap.set('i', '<C-a>', '<esc>A')
vim.keymap.set('i', '<C-p>', '<esc>o')

-- Commond mode
vim.keymap.set('c', '<C-a>', '<Home>')
vim.keymap.set('c', '<C-e>', '<End>')
vim.keymap.set('c', '<C-k>', '<Up>')
vim.keymap.set('c', '<C-j>', '<Down>')
vim.keymap.set('c', '<C-h>', '<Left>')
vim.keymap.set('c', '<C-l>', '<Right>')
vim.keymap.set('c', '<M-h>', '<S-Left>')
vim.keymap.set('c', '<M-l>', '<S-Right>')

-- ===
-- === Window management
-- ===
-- Use <space> + new arrow keys for moving the cursor around windows
vim.keymap.set('', '<leader>w', '<C-w>w')
vim.keymap.set('', '<leader>h', '<C-w>h')
vim.keymap.set('', '<leader>j', '<C-w>j')
vim.keymap.set('', '<leader>k', '<C-w>k')
vim.keymap.set('', '<leader>l', '<C-w>l')
vim.keymap.set('', 'qf', '<C-w>o')
-- Resize splits with arrow keys
vim.keymap.set('', '<leader><up>', ':res +5<cr>')
vim.keymap.set('', '<leader><down>', ':res -5<cr>')
vim.keymap.set('', '<leader><left>', ':vertical resize-5<cr>')
vim.keymap.set('', '<leader><right>', ':vertical resize+5<cr>')
-- split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
vim.keymap.set('', 'sk', ':set nosplitbelow<cr>:split<cr>:set splitbelow<cr>')
vim.keymap.set('', 'sj', ':set splitbelow<cr>:split<cr>')
vim.keymap.set('', 'sh', ':set nosplitright<cr>:vsplit<cr>:set splitright<cr>')
vim.keymap.set('', 'sl', ':set splitright<cr>:vsplit<cr>')
-- Place the two screens up and down
vim.keymap.set('', 'su', '<C-w>t<C-w>K')
-- Place the two screens side by side
vim.keymap.set('', 'sv', '<C-w>t<C-w>H')
-- Rotate screens
vim.keymap.set('', 'srk', '<C-w>b<C-w>K')
vim.keymap.set('', 'srv', '<C-w>b<C-w>H')
-- Press <SPACE> + q to close the window below the current window
vim.keymap.set('', '<leader>q', '<C-w>j:q<cr>')

-- ===
-- === Tab management
-- ===
-- Create a new tab with tu
vim.keymap.set('', 'tu', ':tabe<cr>')
vim.keymap.set('', 'tU', ':tab split<cr>')
-- Move around tabs with tn and ti
vim.keymap.set('', 'tj', ':-tabnext<cr>')
vim.keymap.set('', 'tk', ':+tabnext<cr>')
-- Move the tabs with tmn and tmi
vim.keymap.set('', 'tmj', ':-tabmove<cr>')
vim.keymap.set('', 'tmk', ':+tabmove<cr>')

-- Disable the default s key
vim.keymap.set('', 's', '<nop>')

-- Call figlet. It's fun
--   __ _       _      _   
--  / _(_) __ _| | ___| |_ 
-- | |_| |/ _` | |/ _ \ __|
-- |  _| | (_| | |  __/ |_ 
-- |_| |_|\__, |_|\___|\__|
--        |___/            
vim.keymap.set('', 'tx', ':r !figlet')

-- local function set_bg_light()
--     vim.cmd('set background=light')
--     local colors_name = vim.g.colors_name
--     vim.cmd('colorscheme shine')
--     vim.cmd('colorscheme ' .. colors_name)
-- end
--
-- local function set_bg_dark()
--     vim.cmd('set background=dark')
--     local colors_name = vim.g.colors_name
--     vim.cmd('colorscheme ron')
--     vim.cmd('colorscheme ' .. colors_name)
-- end
--
-- -- keymaps
-- vim.keymap.set('i', '<C-g>', '<esc>')
-- vim.keymap.set('i', '<C-;>', '::') -- for C++ and Rust
-- vim.keymap.set('n', '<leader>vl', set_bg_light)
-- vim.keymap.set('n', '<leader>vd', set_bg_dark)
-- vim.keymap.set('n', '<leader>', ':')
-- -- w: workspace
-- vim.keymap.set('n', '<leader>w8', ':Workspace LeftPanelToggle<cr>')
-- vim.keymap.set('n', '<leader>w9', ':Workspace RightPanelToggle<cr>')
-- vim.keymap.set('n', '<leader>w0', ':Workspace BottomPanelToggle<cr>')
-- -- y: telescope
-- local telescope = require 'telescope.builtin'
-- vim.keymap.set('n', '<F9>', function() telescope.find_files {} end)
-- vim.keymap.set('n', '<F10>', function() telescope.git_files {} end)
-- vim.keymap.set('n', '<F11>', function() telescope.buffers {} end)
-- vim.keymap.set({ 'n', 'i' }, '<C-p>', function() telescope.registers {} end)
-- -- w: window
-- vim.keymap.set('n', '<leader>w1', '<c-w>o')
-- vim.keymap.set('n', '<leader>wx', ':x<cr>')
-- vim.keymap.set('n', '<leader>w2', ':sp<cr>')
-- vim.keymap.set('n', '<leader>w3', ':vs<cr>')
-- -- window resize
-- vim.keymap.set('n', '<m-9>', '<c-w><')
-- vim.keymap.set('n', '<m-0>', '<c-w>>')
-- vim.keymap.set('n', '<m-->', '<c-w>-')
-- vim.keymap.set('n', '<m-=>', '<c-w>+')
-- -- b: buffer
-- vim.keymap.set('n', '<leader>bn', ':bn<cr>')
-- vim.keymap.set('n', '<leader>bp', ':bp<cr>')
-- vim.keymap.set('n', '<leader>bd', ':Bdelete<cr>')
-- -- p: plugins
-- vim.keymap.set('n', '<leader>pi', ':PackerInstall<cr>')
-- vim.keymap.set('n', '<leader>pc', ':PackerClean<cr>')
-- -- s: search
-- vim.keymap.set('n', '<leader>ss', '/')
-- vim.keymap.set('n', '<leader>sw', '/\\<lt>\\><left><left>')
-- -- l/g/w: language
-- -- l: general
-- -- g: goto
-- -- w: workspace
-- -- e: diagnostics
-- vim.keymap.set('n', '<leader>ee', ':Lspsaga show_line_diagnostics<cr>')
-- vim.keymap.set('n', '<leader>ef', ':Lspsaga show_cursor_diagnostics<cr>')
-- vim.keymap.set('n', '<leader>el', ':TroubleToggle<cr>') -- Show list of diagnostics across the workspace
-- vim.keymap.set('n', '<leader>et', ':Trouble<cr>') -- Focus onto the trouble window
-- vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist)
-- vim.keymap.set('n', '<leader>lk', ':Lspsaga hover_doc<cr>')
-- vim.keymap.set('n', '<leader>ld', ':Lspsaga preview_definition<cr>')
-- vim.keymap.set('n', '<leader>lr', ':Lspsaga rename<cr>')
-- vim.keymap.set('n', '<leader>lh', vim.lsp.buf.signature_help)
-- vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting)
-- vim.keymap.set('n', '<leader>la', ':Lspsaga code_action<cr>')
-- vim.keymap.set('n', '<F12>', ':Lspsaga code_action<cr>')
--
-- vim.keymap.set('n', '<leader>gd', ':Glance definitions<CR>')
-- vim.keymap.set('n', '<F4>', ':Glance references<CR>')
-- vim.keymap.set('n', '<leader>gt', ':Glance type_definitions<CR>')
-- vim.keymap.set('n', '<leader>gi', ':Glance implementations<CR>')
-- vim.keymap.set('n', '<leader>gN', ':Lspsaga diagnostic_jump_prev<cr>')
-- vim.keymap.set('n', '<leader>gn', ':Lspsaga diagnostic_jump_next<cr>')
--
-- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder)
-- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder)
-- vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)
--
-- -- t: terminal
-- -- use <f5> to toggle terminal, this can be set in lua/configs/terminal.lua
-- -- the default position is also set in lua/configs/terminal.lua
-- local terminal = require('toggleterm.terminal')
-- vim.keymap.set('t', '<C-g>', '<C-\\><C-n>')
-- vim.keymap.set('n', '<leader>tt', ':ToggleTerm direction=tab<cr>')
-- vim.keymap.set('n', '<leader>tn', function() terminal.Terminal:new():toggle() end)
-- vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<cr>')
-- vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<cr>')
-- vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical<cr>')
--
-- -- h: git
-- vim.keymap.set('n', '<leader>hu', ':Gitsigns undo_stage_hunk<cr>')
-- vim.keymap.set('n', '<leader>hn', ':Gitsigns next_hunk<cr>')
-- vim.keymap.set('n', '<leader>hN', ':Gitsigns next_hunk<cr>')
-- vim.keymap.set('n', '<leader>hc', ':Gitsigns preview_hunk<cr>')
-- vim.keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk<cr>')
-- vim.keymap.set('n', '<leader>hR', ':Gitsigns reset_buffer')
-- vim.keymap.set('n', '<leader>hb', ':Gitsigns blame_line<cr>')
-- vim.keymap.set('n', '<leader>hd', ':Gitsigns diffthis<cr>')
-- vim.keymap.set('n', '<leader>hs', ':<C-U>Gitsigns select_hunk<CR>')
