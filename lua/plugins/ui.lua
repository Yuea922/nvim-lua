-- 
-- Pugins for ui
--
local plugins = {}
local util = require('util')
local icons = require('util.ui').icons
local plug = function(plugin)
    table.insert(plugins, plugin)
end

-- nvim notify
plug {
    'rcarriga/nvim-notify',
    opts = {
        timeout = 3000,
        max_height = function()
            return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
            return math.floor(vim.o.columns * 0.75)
        end,
    },
    init = function()
        -- when noice is not enabled, install notify on VeryLazy
        if not util.has('noice.nvim') then
            util.on_very_lazy(function()
                vim.notify = require('notify')
            end)
        end
    end,
}

-- noice ui
plug {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
        -- which key integration
        {
            'folke/which-key.nvim',
            opts = function(_, opts)
                if require('util').has('noice.nvim') then
                    opts.defaults['<leader>sn'] = { name = '+noice' }
                end
            end,
        },
    },
    opts = {
        lsp = {
            override = {
                ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                ['vim.lsp.util.stylize_markdown'] = true,
                ['cmp.entry.get_documentation'] = true,
            },
        },
        routes = {
            {
                filter = {
                    event = 'msg_show',
                    find = '%d+L, %d+B',
                },
                view = 'mini',
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            inc_rename = true,
        },
    },
    -- stylua: ignore
    keys = {
        { '<S-Enter>', function() require('noice').redirect(vim.fn.getcmdline()) end, mode = 'c', desc = 'Redirect Cmdline' },
        { '<leader>snl', function() require('noice').cmd('last') end, desc = 'Noice Last Message' },
        { '<leader>snh', function() require('noice').cmd('history') end, desc = 'Noice History' },
        { '<leader>sna', function() require('noice').cmd('all') end, desc = 'Noice All' },
        { '<leader>snd', function() require('noice').cmd('dismiss') end, desc = 'Dismiss All' },
        { '<c-f>', function() if not require('noice.lsp').scroll(4) then return '<c-f>' end end, silent = true, expr = true, desc = 'Scroll forward', mode = {'i', 'n', 's'} },
        { '<c-b>', function() if not require('noice.lsp').scroll(-4) then return '<c-b>' end end, silent = true, expr = true, desc = 'Scroll backward', mode = {'i', 'n', 's'}},
    },
}

-- status line
plug {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        {'nvim-tree/nvim-web-devicons', opt = true, lazy = true},
    },
    opts = {
        sections = {
            -- left
            lualine_a = {'mode'},
            lualine_b = {'branch', 
                {
                    'diff',
                    symbols = {
                        added = icons.git.added,
                        modified = icons.git.modified,
                        removed = icons.git.removed,
                    },
                },
            },
            lualine_c = {
                {
                    'diagnostics',
                    symbols = {
                        error = icons.diagnostics.Error,
                        warn = icons.diagnostics.Warn,
                        info = icons.diagnostics.Info,
                        hint = icons.diagnostics.Hint,
                    },
                },
                { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
                { 'filename', path = 1, symbols = { modified = '  ', readonly = '', unnamed = '' } },
                -- stylua: ignore
                {
                    function() return require('nvim-navic').get_location() end,
                    cond = function() return package.loaded['nvim-navic'] and require('nvim-navic').is_available() end,
                },
            },
            -- right
            lualine_x = {
                -- stylua: ignore
                {
                    function() return require('noice').api.status.command.get() end,
                    cond = function() return package.loaded['noice'] and require('noice').api.status.command.has() end,
                    color = util.fg('Statement'),
                },
                -- stylua: ignore
                {
                    function() return require('noice').api.status.mode.get() end,
                    cond = function() return package.loaded['noice'] and require('noice').api.status.mode.has() end,
                    color = util.fg('Constant'),
                },
                -- stylua: ignore
                {
                    function() return '  ' .. require('dap').status() end,
                    cond = function () return package.loaded['dap'] and require('dap').status() ~= '' end,
                    color = util.fg('Debug'),
                },
                { require('lazy.status').updates, cond = require('lazy.status').has_updates, color = util.fg('Special') },
            },
            lualine_y = {
                { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
                { 'location', padding = { left = 0, right = 1 } },
            },
            lualine_z = {
                function()
                    return ' ' .. os.date('%R')
                end,
            },
        },
    },
    config = function(_, opts)
        require('lualine').setup(opts)
    end,
}

-- bufferline
plug {
    'akinsho/bufferline.nvim',
    version = '*',
    event = 'VeryLazy',
    opts = {
        options = {
            mode = 'tabs',
            separator_style = 'slant',
            hover = {
                enabled = true,
                delay = 200,
                reveal = {'close'}
            },
            diagnostics = 'nvim_lsp',
            diagnostics_indicator = function(_, _, diag)
                local diagnostics = icons.diagnostics
                local ret = (diag.error and diagnostics.Error .. diag.error .. ' ' or '')
                    .. (diag.warning and diagnostics.Warn .. diag.warning or '')
                return vim.trim(ret)
            end,
            offsets = {
                {
                    filetype = 'neo-tree',
                    text = 'Neo-tree',
                    highlight = 'Directory',
                    text_align = 'left',
                },
            },
        },
    },
    dependencies = {
        {'nvim-tree/nvim-web-devicons'},
    },
    config = function(_, opts)
        require('bufferline').setup(opts)
    end,
}

-- lsp symbol navigation for lualine
plug {
    'SmiteshP/nvim-navic',
    lazy = true,
    init = function()
        vim.g.navic_silence = true
        require('util').on_attach(function(client, buffer)
            if client.server_capabilities.documentSymbolProvider then
                require('nvim-navic').attach(client, buffer)
            end
        end)
    end,
    opts = function()
        return {
            separator = ' ',
            highlight = true,
            depth_limit = 5,
            icons = require('util.ui').icons.kinds,
        }
    end,
}

-- indent guides for Neovim
plug {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
        -- char = "▏",
        char = "│",
        filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
        show_trailing_blankline_indent = false,
        show_current_context = false,
    },
}

-- icons
plug {'nvim-tree/nvim-web-devicons', lazy = true}

return plugins
