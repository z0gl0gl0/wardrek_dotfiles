vim.opt.signcolumn = 'yes'

local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.nvim_workspace()

lsp.set_preferences({
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

-- Keymaps
-- local opts = { noremap = true, silent = true }
local wk = require("which-key")
wk.register({
    vd = { vim.diagnostic.open_float, "Open Diagnostic Window", noremap = true, silent = true },
    ["<left>"] = { vim.diagnostic.goto_prev, "Previous Diagnostic", noremap = true, silent = true },
    ["<right>"] = { vim.diagnostic.goto_next, "Next Diagnostic", noremap = true, silent = true },
}, { prefix = "<leader>" })

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Buffer local mappings
        local bufopts = function (desc)
            return { buffer = ev.buf, desc = desc }
        end
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts('Go to Declaration'))
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts('Go to Definition'))
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts('Hover'))
        vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, bufopts('Go to Implementation'))
        vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, bufopts('Signature Help'))
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts('Add Workspace Folder'))
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts('Remove Workspace Folder'))
        vim.keymap.set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts('List Workspace Folder'))
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts('Type Definition'))
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts('Rename with LSP'))
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, bufopts('Code Action'))
        vim.keymap.set('n', 'gR', vim.lsp.buf.references, bufopts('Go to Reference'))
        vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format({ async = true })
        end, bufopts('Formatting with LSP'))
    end,
})
-- lsp.on_attach(function(client, bufnr)
--   local opts = {buffer = bufnr, remap = false}

--   vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--   vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--   vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--   -- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
--   -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
--   -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
--   vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
--   vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--   vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--   vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
-- end)

lsp.setup()

require'lspconfig'.pylsp.setup{
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = {},
                    maxLineLength = 160,
                },
            },
        },
    },
}

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require('cmp')
cmp.setup ({

    preselect = 'none',
    completion = {
        completeopt = 'menu,menuone,noinsert,noselect'
    },
    source = {
        { name = "luasnip" }
    },

    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },

    snippet = {
        expand = function(args)
            local ls = require("luasnip")
            if not ls then
                return
            end
            ls.lsp_expand(args.body)
        end,
    },

})

vim.diagnostic.config({
    virtual_text = true,
    underline = false,
})
