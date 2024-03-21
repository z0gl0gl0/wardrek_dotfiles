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
nnoremap("]d", function()
	vim.diagnostic.goto_next({})
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto prev diagnostic of any severity
nnoremap("[d", function()
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

-- Characters/Words/Lines count
nnoremap("<leader>cc", "<cmd>!wc -m %<cr>")
nnoremap("<leader>cw", "<cmd>!wc -w %<cr>")
nnoremap("<leader>cl", "<cmd>!wc -l %<cr>")

-- Plugins remap --

-- Telescope
local telescope = require('telescope.builtin')
nnoremap('<leader>fp', telescope.find_files, {})
nnoremap('<leader>fg', telescope.git_files, {})
nnoremap('<leader>fb', telescope.buffers, {})
nnoremap('<leader>fr', telescope.oldfiles, {})
nnoremap('<leader>fl', telescope.current_buffer_fuzzy_find, {})

-- Trouble
nnoremap('<leader>tt', function()
    require("trouble").toggle('workspace_diagnostics')
end)

nnoremap('<leader>td', function()
    require("trouble").toggle('todo')
end)
--
-- Trouble: jumpings
vim.keymap.set("n", "]t", function()
    require("trouble").next({ skip_groups = true, jump = true })
end, {})

vim.keymap.set("n", "[t", function()
    require("trouble").previous({ skip_groups = true, jump = true })
end, {})

-- Todo-comment
nnoremap('<leader>ft', '<cmd>TodoTelescope<cr>', {})


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

-- Gitutter --
-- Stage hunk under cursor
nnoremap("<leader>hs", "<cmd>GitGutterStageHunk<cr>")
-- Undo hunk under cursor
nnoremap("<leader>hu", "<cmd>GitGutterUndoHunk<cr>")
-- Preview branch hunk under cursor
nnoremap("<leader>hp", "<cmd>GitGutterPreviewHunk<cr>")
-- Goto next hunk
nnoremap("]h", "<cmd>GitGutterNextHunk<cr>")
-- Goto prev hunk
nnoremap("[h", "<cmd>GitGutterPrevHunk<cr>")

-- Undotree
nnoremap("<leader>u", vim.cmd.UndotreeToggle)

-- LSP Keybinds (exports a function to be used in ../../after/plugin/lsp.lua b/c we need a reference to the current buffer) --
M.map_lsp_keybinds = function(buffer_number)
    -- Rename variable
	nnoremap("<leader>rn", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame", buffer = buffer_number })

    -- LSP code action
	nnoremap("<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction", buffer = buffer_number })

    -- Goto definition
	nnoremap("gd", vim.lsp.buf.definition, { desc = "LSP: [G]oto [D]efinition", buffer = buffer_number })

	-- Telescope LSP keybinds --
    -- Goto reference
	nnoremap(
		"gr",
		require("telescope.builtin").lsp_references,
		{ desc = "LSP: [G]oto [R]eferences", buffer = buffer_number }
	)

    -- Goto implementation
	nnoremap(
		"gi",
		require("telescope.builtin").lsp_implementations,
		{ desc = "LSP: [G]oto [I]mplementation", buffer = buffer_number }
	)

    -- List of symbols in the current buffer
	nnoremap(
		"<leader>bs",
		require("telescope.builtin").lsp_document_symbols,
		{ desc = "LSP: [B]uffer [S]ymbols", buffer = buffer_number }
	)

    -- List of symbols in the workspace
	nnoremap(
		"<leader>ps",
		require("telescope.builtin").lsp_workspace_symbols,
		{ desc = "LSP: [P]roject [S]ymbols", buffer = buffer_number }
	)

    -- Hover documentation
	nnoremap("K", vim.lsp.buf.hover, { desc = "LSP: Hover Documentation", buffer = buffer_number })

    -- Signature documentation
	nnoremap("<leader>k", vim.lsp.buf.signature_help, { desc = "LSP: Signature Documentation", buffer = buffer_number })
	inoremap("<C-k>", vim.lsp.buf.signature_help, { desc = "LSP: Signature Documentation", buffer = buffer_number })

	-- Goto declaration
	nnoremap("gD", vim.lsp.buf.declaration, { desc = "LSP: [G]oto [D]eclaration", buffer = buffer_number })

    -- Type definition
	nnoremap("td", vim.lsp.buf.type_definition, { desc = "LSP: [T]ype [D]efinition", buffer = buffer_number })
end

return M
