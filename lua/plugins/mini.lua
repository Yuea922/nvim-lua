-- 
-- Parts of mini.nvim
--
local plugins = {}
local plug = function(plugin)
    table.insert(plugins, plugin)
end

plug {
    'echasnovski/mini.surround',
    version = false,
    opts = {
        mappings = {
            add            = 'sa', -- Add surrounding in Normal and Visual modes
            delete         = 'sd', -- Delete surrounding
            find           = '',   -- Find surrounding (to the right)
            find_left      = '',   -- Find surrounding (to the left)
            highlight      = '',   -- Highlight surrounding
            replace        = 'sr', -- Replace surrounding
            update_n_lines = '',   -- Update `n_lines` 
        },
    },

    config = function(_, opts)
        require('mini.surround').setup(opts)
    end
}

plug {
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
    config = function()
        require('mini.pairs').setup()
    end
}

plug {
    'echasnovski/mini.bracketed',
    branch = 'stable',
    keys = {
        {'[c', "<cmd>lua MiniBracketed.conflict('backward')<cr>", mode = {'n', 'x'}},
        {']c', "<cmd>lua MiniBracketed.conflict('forward')<cr>", mode = {'n', 'x'}},

        {'[q', "<cmd>lua MiniBracketed.quickfix('backward')<cr>"},
        {']q', "<cmd>lua MiniBracketed.quickfix('forward')<cr>"},
    },
    opts = {
        buffer     = {suffix = ''},
        comment    = {suffix = ''},
        conflict   = {suffix = ''},
        diagnostic = {suffix = ''},
        file       = {suffix = ''},
        indent     = {suffix = ''},
        jump       = {suffix = ''},
        location   = {suffix = ''},
        oldfile    = {suffix = ''},
        quickfix   = {suffix = ''},
        treesitter = {suffix = ''},
        undo       = {suffix = ''},
        window     = {suffix = ''},
        yank       = {suffix = ''},
    },
    config = function(_, opts)
        require('mini.bracketed').setup(opts)
    end
}

plug {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        -- symbol = "▏",
        symbol = "│",
        options = { try_as_border = true },
    },
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
            callback = function()
                vim.b.miniindentscope_disable = true
            end,
        })
    end,
}

return plugins
