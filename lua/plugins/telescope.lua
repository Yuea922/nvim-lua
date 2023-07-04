-- 
-- Fuzzy finder
--
local plugin = {'nvim-telescope/telescope.nvim'}
local user = {}

plugin.dependencies = {
    {'nvim-lua/plenary.nvim'},
    {
        'nvim-telescope/telescope-fzy-native.nvim',
        -- build = function() user.build_fzy() end
    }
}

plugin.cmd = 'Telescope'

plugin.version = false

plugin.keys = {
    -- Search pattern
    { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Grep (root dir)' },

    -- Show key vim.keymap.setings list
    -- vim.keymap.set('n', '<leader>?', '<cmd>Telescope keymaps<cr>')
    { '<leader>fk', '<cmd>Telescope keymaps<cr>', desc = 'Key Maps' },

    -- Find files by name
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files (root dir)' },

    -- Search symbols in buffer
    -- vim.keymap.set('n', '<leader>fs', '<cmd>Telescope treesitter<cr>')

    -- Search buffer lines
    { '<leader>fb', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Buffer' },

    -- Search in files history
    { '<leader>fh', '<cmd>Telescope oldfiles<cr>', desc = 'Recent' },

    -- { "<leader>sG", telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
    -- Search in active buffers list
    { '<leader>bl', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },

    { '<leader>sb', '<cmd>Telescope buffers show_all_buffers=true<cr>', desc = 'Switch Buffer' },
    -- {
    --     "<leader>ss",
    --     Util.telescope("lsp_document_symbols", {
    --     symbols = {
    --         "Class",
    --         "Function",
    --         "Method",
    --         "Constructor",
    --         "Interface",
    --         "Module",
    --         "Struct",
    --         "Trait",
    --         "Field",
    --         "Property",
    --     },
    --     }),
    --     desc = "Goto Symbol",
    -- },
    -- {
    --     "<leader>sS",
    --     Util.telescope("lsp_dynamic_workspace_symbols", {
    --     symbols = {
    --         "Class",
    --         "Function",
    --         "Method",
    --         "Constructor",
    --         "Interface",
    --         "Module",
    --         "Struct",
    --         "Trait",
    --         "Field",
    --         "Property",
    --     },
    --     }),
    --     desc = "Goto Symbol (Workspace)",
    -- },
}

plugin.opts = {
    defaults = {
        mappings = {
            i = {
                ['<esc>'] = function(...)
                    return require('telescope.actions').close(...)
                end,
            -- ['<M-k>'] = actions.move_selection_previous,
            -- ['<M-j>'] = actions.move_selection_next,
            }
        },
        -- Default layout options
        prompt_prefix = ' 🔍 ',
        sorting_strategy = 'ascending',
        layout_config = {
            -- preview_cutoff = 25,
            prompt_position = 'top'
        },
    },
    extension = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true
        },
    }
}

plugin.config = function(_, opts)
    require('telescope').setup(opts)
    require('telescope').load_extension('fzy_native')
end
--
-- function user.job_output(cid, data, name)
--   for i, val in pairs(data) do
--     print(val)
--   end
-- end
--
-- function user.build_fzy()
--   if vim.fn.executable('make') == 0 then
--     return
--   end
--
--   local workdir = vim.api.nvim_get_runtime_file('deps/fzy-lua-native', 1)
--
--   if workdir[1] == nil then
--     return
--   end
--
--   vim.fn.jobstart({'make'}, {
--     cwd = workdir[1],
--     on_stdout = user.job_output,
--   })
-- end

return plugin
