-- Restore cursor position
vim.api.nvim_create_autocmd({"BufReadPost"}, {
    group = vim.api.nvim_create_augroup("restore_cursor_pos", { clear = true}),
    pattern = "*",
    desc = "Restore cursor position",
    callback = function()
        vim.cmd('silent! normal! g`"zv')
    end,
})

