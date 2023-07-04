-- 
-- Plugins for editor
--
local plugins = {}
local util = require('util')
local icons = require('util.ui').icons
local plug = function(plugin)
    table.insert(plugins, plugin)
end

-- file explorer 
plug {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    cmd = 'Neotree',
    -- keys = {
    --     {
    --     "<leader>fe",
    --     function()
    --         require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
    --     end,
    --     desc = "Explorer NeoTree (root dir)",
    --     },
    --     {
    --     "<leader>fE",
    --     function()
    --         require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
    --     end,
    --     desc = "Explorer NeoTree (cwd)",
    --     },
    --     { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
    --     { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
    -- },
    -- deactivate = function()
    --     vim.cmd([[Neotree close]])
    -- end
    -- plugin.init = function()
    --     -- Unless you are still migrating, remove the deprecated commands from v1.x
    --     -- vim.cmd.g:neo_tree_remove_legacy_commands = 1
    -- end
    opts = {

    },
    config = function(_, opts)
        require('neo-tree').setup(opts)
    end
}
    

-- which-key
plug {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        plugins = { spelling = true },
        defaults = {
            mode = { "n", "v" },
            ["g"] = { name = "+goto" },
            ["gz"] = { name = "+surround" },
            ["]"] = { name = "+next" },
            ["["] = { name = "+prev" },
            ["<leader><tab>"] = { name = "+tabs" },
            ["<leader>b"] = { name = "+buffer" },
            ["<leader>c"] = { name = "+code" },
            ["<leader>f"] = { name = "+file/find" },
            ["<leader>g"] = { name = "+git" },
            ["<leader>gh"] = { name = "+hunks" },
            ["<leader>q"] = { name = "+quit/session" },
            ["<leader>s"] = { name = "+search" },
            ["<leader>u"] = { name = "+ui" },
            ["<leader>w"] = { name = "+windows" },
            ["<leader>x"] = { name = "+diagnostics/quickfix" },
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.register(opts.defaults)
    end,
}


-- Word matching
plug {
    'RRethy/vim-illuminate',
    event = { "BufReadPost", "BufNewFile" },
    opts = { delay = 200 },
    config = function(_, opts)
        require("illuminate").configure(opts)

        local function map(key, dir, buffer)
            vim.keymap.set("n", key, function()
                require("illuminate")["goto_" .. dir .. "_reference"](false)
            end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
        end

        map("]]", "next")
        map("[[", "prev")

        -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                local buffer = vim.api.nvim_get_current_buf()
                map("]]", "next", buffer)
                map("[[", "prev", buffer)
            end,
        })
    end,
    -- keys = {
    --     { "]]", desc = "Next Reference" },
    --     { "[[", desc = "Prev Reference" },
    -- },
}

return plugins
