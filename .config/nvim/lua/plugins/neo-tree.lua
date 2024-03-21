return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    ft = 'netrw',
    cmd = 'Neotree',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "none" })
        require("neo-tree").setup({
            window = {
                position = "float",
            },
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    never_show_by_pattern = {
                        "*.nc",
                        "*.png",
                    },
                },
                hijack_netrw_behavior = 'open_current',
                bind_to_cwd = false, -- Don't change directory
            },
        })

        -- Manage netrw in neotree (mainly for harpoon)
        ---@diagnostic disable-next-line: undefined-field
        if vim.bo.filetype == 'netrw' and vim.b.netrw_method == nil then
            vim.defer_fn(function()
                ---@diagnostic disable-next-line: undefined-field
                vim.cmd('enew | Neotree current dir=' .. vim.b.netrw_curdir)
            end, 0)
        end
    end,
}
