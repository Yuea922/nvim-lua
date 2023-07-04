local plugin = {'hrsh7th/nvim-cmp'}

plugin.dependencies = {
    -- Sources
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
}

-- Enter insert model
plugin.event = 'InsertEnter'

plugin.opts = function()
    local cmp = require('cmp')

    return {
        completion = {
            completeopt = 'menu, menuone, noinsert',
        },
        sources = {
            {name = 'path'},
            {name = 'nvim_lsp'},
            {name = 'buffer'},
            {name = 'luasnip'},
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
            ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ["<S-CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        -- formatting = {
        --     format = function(_, item)
        --         local icons = require("lazyvim.config").icons.kinds
        --         if icons[item.kind] then
        --             item.kind = icons[item.kind] .. item.kind
        --         end
        --         return item
        --     end,
        -- },
    }
end

plugin.config = function(_, opts)
    require('cmp').setup(opts)
end

-- function Plugin.config()
--     user.augroup = vim.api.nvim_create_augroup('compe_cmds', {clear = true})
--     vim.api.nvim_create_user_command('UserCmpEnable', user.enable_cmd, {})
--
--     local cmp = require('cmp')
--     local luasnip = require('luasnip')
--
--     local select_opts = {behavior = cmp.SelectBehavior.Select}
--     local cmp_enable = cmp.get_config().enabled
--
--     user.config = {
--         -- enabled = function()
--         --     if user.autocomplete then
--         --         return cmp_enable()
--         --     end
--         --
--         --     return false
--         -- end,
--         snippet = {
--             expand = function(args)
--                 luasnip.lsp_expand(args.body)
--             end,
--         },
--         window = {
--         documentation = {
--             border = 'rounded',
--             max_height = 15,
--             max_width = 50,
--             zindex = 50,
--         }
--         },
--         mapping = {
--         ['<C-u>'] = cmp.mapping.scroll_docs(-5),
--         ['<C-d>'] = cmp.mapping.scroll_docs(5),
--
--         ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
--         ['<Down>'] = cmp.mapping.select_next_item(select_opts),
--
--         ['<M-k>'] = cmp.mapping.select_prev_item(select_opts),
--         ['<M-j>'] = cmp.mapping.select_next_item(select_opts),
--
--         ['<C-a>'] = cmp.mapping(function(fallback)
--             if luasnip.jumpable(-1) then
--             luasnip.jump(-1)
--             else
--             fallback()
--             end
--         end, {'i', 's'}),
--
--         ['<C-d>'] = cmp.mapping(function(fallback)
--             if luasnip.jumpable(1) then
--             luasnip.jump(1)
--             else
--             fallback()
--             end
--         end, {'i', 's'}),
--
--         ['<M-u>'] = cmp.mapping(function()
--             if cmp.visible() then
--             user.set_autocomplete(false)
--             cmp.abort()
--             else
--             user.set_autocomplete(true)
--             cmp.complete()
--             end
--         end),
--
--         ['<Tab>'] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--             cmp.confirm({select = true})
--             elseif luasnip.jumpable(1) then
--             luasnip.jump(1)
--             elseif user.check_back_space() then
--             fallback()
--             else
--             user.set_autocomplete(true)
--             cmp.complete()
--             end
--         end, {'i', 's'}),
--
--         ['<S-Tab>'] = cmp.mapping(function()
--             if luasnip.jumpable(-1) then
--             luasnip.jump(-1) 
--             else
--             user.insert_tab()
--             end
--         end, {'i', 's'}),
--         }
--     }
--
--     cmp.setup(user.config)
-- end
--
-- function user.set_autocomplete(new_value)
--     local old_value = user.autocomplete
--
--     if new_value == old_value then
--         return
--     end
--
--     if new_value == false then
--         -- restore autocomplete in the next word
--         vim.api.nvim_buf_set_keymap(
--         0,
--         'i',
--         '<space>',
--         '<cmd>UserCmpEnable<cr><space>',
--         {noremap = true}
--         )
--
--         -- restore when leaving insert mode
--         vim.api.nvim_create_autocmd('InsertLeave', {
--         group = user.augroup,
--         command = 'UserCmpEnable',
--         once = true,
--         })
--     end
--
--     user.autocomplete = new_value
-- end
--
--
-- function user.check_back_space()
--     local col = vim.fn.col('.') - 1
--     if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
--         return true
--     else
--         return false
--     end
-- end
--
-- function user.enable_cmd()
--     if user.autocomplete then
--         return
--     end
--
--     pcall(vim.api.nvim_buf_del_keymap, 0, 'i', '<Space>')
--     user.set_autocomplete(true)
-- end
--
-- function user.insert_tab()
--     vim.api.nvim_feedkeys(
--         vim.api.nvim_replace_termcodes('<Tab>', true, true, true),
--         'n',
--         true 
--     )
-- end

return plugin
