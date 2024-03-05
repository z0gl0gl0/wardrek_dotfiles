return {
    "ixru/nvim-markdown",
    event = { "BufReadPost" },
    config = function ()
        vim.g.vim_markdown_conceal = 1
        -- Disable overrides new line above/below
        vim.keymap.set('n', '<Plug>', '<Plug>Markdown_NewLineAbove')
        vim.keymap.set('n', '<Plug>', '<Plug>Markdown_NewLineBelow')
    end
}
