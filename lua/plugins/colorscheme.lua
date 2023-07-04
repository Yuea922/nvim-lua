-- 
-- themes
--
local plugins = {}
local plug = function(plugin)
    table.insert(plugins, plugin)
end

-- tokyonight
plug {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
}

-- catppuccin
plug {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
}

plug {
    "sainnhe/edge",
    lazy = true,
}

plug {
    "Iron-E/nvim-highlite",
    lazy = true,
}

return plugins
