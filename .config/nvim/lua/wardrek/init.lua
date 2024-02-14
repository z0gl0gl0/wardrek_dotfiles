require("wardrek.remap")
require("wardrek.set")

local augroup = vim.api.nvim_create_augroup
local WardrekGroup = augroup('Wardrek', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

-- Highlight yankzone
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- Remove trailing white spaces
autocmd({"BufWritePre"}, {
    group = WardrekGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Restore cursor position
autocmd({"BufReadPost"}, {
    group = WardrekGroup,
    pattern = "*",
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})
