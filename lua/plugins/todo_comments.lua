return {
    "folke/todo-comments.nvim",
    -- event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        signs = false,
        keywords = {
            TODO = { color = "#458588" },
        },
    }
}
