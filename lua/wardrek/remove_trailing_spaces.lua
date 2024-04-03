-- Remove trailing white spaces
vim.api.nvim_create_autocmd({"BufWritePre"}, {
    group = vim.api.nvim_create_augroup("remove_trailing_spaces", { clear = true }),
    pattern = "*",
    desc = "Remove trailing white spaces",
    command = [[%s/\s\+$//e]],
})
