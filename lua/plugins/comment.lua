local plugin = {'numToStr/Comment.nvim'}

plugin.config = function()
    require('Comment').setup()
end

return plugin
