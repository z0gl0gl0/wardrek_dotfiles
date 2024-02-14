-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    filters = {
        dotfiles = false,
        exclude = { "zsh" }
    },
})

-- vim.api.nvim_create_autocmd("BufEnter", {
--     nested = true,
--     callback = function()
--         if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
--             vim.cmd "quit"
--         end
--     end
-- })

vim.keymap.set("n", "<F3>", vim.cmd.NvimTreeToggle)
