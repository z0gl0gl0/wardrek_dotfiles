return {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function ()
        local map_gitsigns_keybinds = require("wardrek.keymaps").map_gitsigns_keybinds
        require('gitsigns').setup({
            on_attach = function(buffer_number)
                map_gitsigns_keybinds(buffer_number)
            end
        })
    end
}
