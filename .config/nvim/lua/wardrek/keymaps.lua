local nnoremap = require("wardrek.keymap_utils").nnoremap
local vnoremap = require("wardrek.keymap_utils").vnoremap
local inoremap = require("wardrek.keymap_utils").inoremap
local tnoremap = require("wardrek.keymap_utils").tnoremap
local xnoremap = require("wardrek.keymap_utils").xnoremap

local M = {}

-- Disable Space bar since it'll be used as the leader key
nnoremap("<space>", "<nop>")
vnoremap("<space>", "<nop>")

-- Tmux fuzzy find
nnoremap("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Open file tree
nnoremap("<leader>e", vim.cmd.Ex)

-- Center buffer while navigating
nnoremap("J", "mzJ`z")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("G", "Gzz")
nnoremap("gg", "ggzz")

-- Paste without deleting what's in the yank
xnoremap("<leader>p", [["_dP]])

-- Copy the selection in the clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
nnoremap("<leader>Y", [["+Y]])

-- Delete without yank
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Remap <C-c> to esc to avoid weird interaction
inoremap("<C-c>", "<Esc>")

-- <leader>s for quick find/replace for the word under the cursor
nnoremap("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- <leader>x for quich cmod +x current file
nnoremap("<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- exit insert mode
inoremap("jk", "<Esc>")

-- exit terminal mode
tnoremap("<c-c>", "<C-\\><C-n>")

-- Exit insert mode after creating a new line above or below the current line.
nnoremap("o", "o<Esc>")
nnoremap("O", "O<Esc>")

-- Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
-- nnoremap("<c-j>", "<c-w>j")
-- nnoremap("<c-k>", "<c-w>k")
-- nnoremap("<c-h>", "<c-w>h")
-- nnoremap("<c-l>", "<c-w>l")

-- Resize split windows using arrow keys by pressing:
-- CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
nnoremap("<c-up>", "<c-w>+")
nnoremap("<c-down>", "<c-w>-")
nnoremap("<c-left>", "<c-w>>")
nnoremap("<c-right>", "<c-w><")

-- Goto next diagnostic of any severity
nnoremap("<a-<>", function()
	vim.diagnostic.goto_next({})
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto prev diagnostic of any severity
nnoremap("<a->>", function()
	vim.diagnostic.goto_prev({})
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto next error diagnostic
nnoremap("]e", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous error diagnostic
nnoremap("[e", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto next warning diagnostic
nnoremap("]w", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous warning diagnostic
nnoremap("[w", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Open diagnostic window
nnoremap("<leader>d", function()
	vim.diagnostic.open_float({
		border = "rounded",
	})
end)

-- <leader>f to format
nnoremap("<leader>f", ":Format<cr>")

-- Move selected text up/down in visual mode
vnoremap("<A-j>", ":m '>+1<CR>gv=gv")
vnoremap("<A-k>", ":m '<-2<CR>gv=gv")

-- Reselect the last visual selection
xnoremap("<", function()
    vim.cmd("normal! <")
    vim.cmd("normal! gv")
end)

xnoremap(">", function()
	vim.cmd("normal! >")
	vim.cmd("normal! gv")
end)

-- Words count
-- wk.register({
--     c = {
--         name = "Count",
--         c = { "<cmd>!wc -m %<CR>", "Characters count" },
--         w = { "<cmd>!wc -w %<CR>", "Words count" },
--         l = { "<cmd>!wc -l %<CR>", "Lines count" },
--     },
-- }, { prefix = "<leader>" })

-- Plugins remap

-- Telescope
local telescope = require('telescope.builtin')
nnoremap('<leader>fp', telescope.find_files, {})
nnoremap('<leader>fg', telescope.git_files, {})
nnoremap('<leader>fb', telescope.buffers, {})
nnoremap('<leader>fr', telescope.oldfiles, {})
nnoremap('<leader>fl', telescope.current_buffer_fuzzy_find, {})

-- Harpoon
local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")

-- Open harpoon ui
nnoremap('<leader>ho', function()
    harpoon_ui.toggle_quick_menu()
end)

-- Add current file to harpoon
nnoremap("<leader>ha", function()
	harpoon_mark.add_file()
end)

-- Remove current file from harpoon
nnoremap("<leader>hr", function()
	harpoon_mark.rm_file()
end)

-- Remove all files from harpoon
nnoremap("<leader>hc", function()
	harpoon_mark.clear_all()
end)

-- Quickly jump to harpooned files
nnoremap("<leader>1", function()
	harpoon_ui.nav_file(1)
end)

nnoremap("<leader>2", function()
	harpoon_ui.nav_file(2)
end)

nnoremap("<leader>3", function()
	harpoon_ui.nav_file(3)
end)

nnoremap("<leader>4", function()
	harpoon_ui.nav_file(4)
end)

nnoremap("<leader>5", function()
	harpoon_ui.nav_file(5)
end)

-- Fugitive
nnoremap("<leader>gs", vim.cmd.Git)

-- Gitutter
nnoremap("<leader>hs", "<cmd>GitGutterStageHunk<cr>")
nnoremap("<leader>hu", "<cmd>GitGutterUndoHunk<cr>")
nnoremap("<leader>hp", "<cmd>GitGutterPreviewHunk<cr>")

-- Undotree
nnoremap("<leader>u", vim.cmd.UndotreeToggle)

-- LSP Keybinds (exports a function to be used in ../../after/plugin/lsp.lua b/c we need a reference to the current buffer) --
M.map_lsp_keybinds = function(buffer_number)
	nnoremap("<leader>rn", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame", buffer = buffer_number })
	nnoremap("<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction", buffer = buffer_number })

	nnoremap("gd", vim.lsp.buf.definition, { desc = "LSP: [G]oto [D]efinition", buffer = buffer_number })

	-- Telescope LSP keybinds --
	nnoremap(
		"gr",
		require("telescope.builtin").lsp_references,
		{ desc = "LSP: [G]oto [R]eferences", buffer = buffer_number }
	)

	nnoremap(
		"gi",
		require("telescope.builtin").lsp_implementations,
		{ desc = "LSP: [G]oto [I]mplementation", buffer = buffer_number }
	)

	nnoremap(
		"<leader>bs",
		require("telescope.builtin").lsp_document_symbols,
		{ desc = "LSP: [B]uffer [S]ymbols", buffer = buffer_number }
	)

	nnoremap(
		"<leader>ps",
		require("telescope.builtin").lsp_workspace_symbols,
		{ desc = "LSP: [P]roject [S]ymbols", buffer = buffer_number }
	)

	-- See `:help K` for why this keymap
	nnoremap("K", vim.lsp.buf.hover, { desc = "LSP: Hover Documentation", buffer = buffer_number })
	nnoremap("<leader>k", vim.lsp.buf.signature_help, { desc = "LSP: Signature Documentation", buffer = buffer_number })
	inoremap("<C-k>", vim.lsp.buf.signature_help, { desc = "LSP: Signature Documentation", buffer = buffer_number })

	-- Lesser used LSP functionality
	nnoremap("gD", vim.lsp.buf.declaration, { desc = "LSP: [G]oto [D]eclaration", buffer = buffer_number })
	nnoremap("td", vim.lsp.buf.type_definition, { desc = "LSP: [T]ype [D]efinition", buffer = buffer_number })
end

return M