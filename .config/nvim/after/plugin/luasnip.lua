local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

local luasnip = require("luasnip")

luasnip.config.set_config({
  store_selection_keys = '<c-s>',
})

local snip = luasnip.snippet
local node = luasnip.snippet_node
local text = luasnip.text_node
local insert = luasnip.insert_node
local func = luasnip.function_node
local choice = luasnip.choice_node
local dynamicn = luasnip.dynamic_node

local date = function()
    return { os.date "%d-%m-%Y" }
end

local filename = function()
    return { vim.fn.expand "%:p" }
end

-- Make sure to not pass an invalid command, as io.popen() may write over nvim-text.
local function bash(_, _, command)
    local file = io.popen(command, "r")
    local res = {}
    for line in file:lines() do
        table.insert(res, line)
    end
    return res
end

luasnip.add_snippets(nil, {
    all = {
        snip({
            trig = "date",
            namr = "Date",
            dscr = "Date in the form of DD-MM-YYYY",
        }, {
            func(date, {}),
        }),
        snip({
            trig = "pwd",
            namr = "PWD",
            dscr = "Path to current working directory",
        }, {
            func(bash, {}, { user_args = { "pwd" } }),
        }),
        snip({
            trig = "filename",
            namr = "Filename",
            dscr = "Absolute path to file",
        }, {
            func(filename, {}),
        }),
    },
    sh = {
        snip("shebang", {
            text { "#!/bin/sh", "" },
            insert(0),
        }),
    },
    python = {
        snip("shebang", {
            text { "#!/usr/bin/env python", "" },
            insert(0),
        }),
    },
    lua = {
        snip("shebang", {
            text { "#!/usr/bin/lua", "", "" },
            insert(0),
        }),
    },
    markdown = {
        -- Select link, press C-s, enter link to receive snippet
        snip({
            trig = "link",
            namr = "markdown_link",
            dscr = "Create markdown link [txt](url)",
        }, {
            text "[",
            insert(1),
            text "](",
            func(function(_, snip)
                return snip.env.TM_SELECTED_TEXT[1] or {}
            end, {}),
            text ")",
            insert(0),
        }),
        snip({
            trig = "codewrap",
            namr = "markdown_code_wrap",
            dscr = "Create markdown code block from existing text",
        }, {
            text "``` ",
            insert(1, "Language"),
            text { "", "" },
            func(function(_, snip)
                local tmp = {}
                tmp = snip.env.TM_SELECTED_TEXT
                tmp[0] = nil
                return tmp or {}
            end, {}),
            text { "", "```", "" },
            insert(0),
        }),
        snip({
            trig = "math",
            namr = "math_empty",
            dscr = "Create empty math block",
        }, {
            text "$",
            insert(1, "Equation"),
            text "$",
            insert(0),
        }),
        snip({
            trig = "mathwrap",
            namr = "math_equation_wrap",
            dscr = "Create math block from existing equation",
        }, {
            text "$",
            func(function(_, snip)
                local tmp = {}
                tmp = snip.env.TM_SELECTED_TEXT
                tmp[0] = nil
                return tmp or {}
            end, {}),
            text "$",
            insert(0),
        }),
    },
})
