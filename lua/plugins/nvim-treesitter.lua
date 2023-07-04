--
-- Highlight
--
local plugin = {'nvim-treesitter/nvim-treesitter'}
plugin.pin = true

plugin.dependencies = {
    {'nvim-treesitter/nvim-treesitter-textobjects', pin = true},
    {'JoosepAlviste/nvim-ts-context-commentstring'},
    {'HiPhish/nvim-ts-rainbow2'}
}

plugin.opts = {
    highlight = {
        enable = true,
    },
    ensure_installed = {
        'cpp',
        'c',
        'cmake',
        'bash',
        'markdown',
        'javascript',
        'typescript',
        'tsx',
        'php',
        'css',
        'json',
        'lua',
        'vim',
    },
    -- rainbow = {
    --     enable = true,
    --     -- list of languages you want to disable the plugin for
    --     disable = { 'jsx', 'cpp' },
    --     -- Which query to use for finding delimiters
    --     query = 'rainbow-parens',
    --     -- Highlight the entire buffer all at once
    --     strategy = require('ts-rainbow').strategy.global,
    -- },
}

plugin.build = function()
    pcall(vim.cmd, 'TSUpdate')
end

plugin.config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
end

return plugin
