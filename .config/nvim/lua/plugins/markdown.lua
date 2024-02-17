return {
    "ixru/nvim-markdown",
    event = { "BufReadPost" },
    config = function ()
        vim.g.vim_markdown_conceal = 1
    end
}
