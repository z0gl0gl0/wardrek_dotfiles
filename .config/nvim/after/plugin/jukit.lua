local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Splits
-- Opens a new output window and executes the command specified in `g:jukit_shell_cmd`
map('n', '<leader>os', ':call jukit#splits#output()<cr>', opts)
map('n', '<leader>oc', ':JukitOut conda activate 4dvarnet<cr>', opts)
-- Opens a new output-history window, where saved ipython outputs are displayed
map('n', '<leader>hs', ':call jukit#splits#history()<cr>', opts)


-- Sending code
-- Send code within the current cell to output split (also saves the output if ipython is used and
-- `g:jukit_save_output==1`). Argument: if 1, will move the cursor to the next cell below after sending
-- the code to the split, otherwise cursor position stays the same.
map('n', '<leader><space>', ':call jukit#send#section(1)<cr>', opts)
-- Send current line to output split
map('n', '<leader><cr>', ':call jukit#send#line()<cr>', opts)
-- Send visually selected code to output split
map('v', '<leader><cr>', ':call jukit#send#line()<cr>', opts)
-- Execute all cells until the current cell
map('n', '<leader>cc', ':call jukit#send#until_current_section()<cr>', opts)
-- Execute all cells
map('n', '<leader>all', ':call jukit#send#all()<cr>', opts)

-- local wk = require("which-key")

-- wk.register({
--     ['<cr'] = { "<cmd>:call jukit#send#line()<cr>", 'Send current line to output split' }
--         -- name = "Git",
--         -- s = { vim.cmd.Git, "Git status" },
--         -- h = {
--         --     name = "Gitgutter",
--         --     s = { "<cmd>GitGutterStageHunk<cr>", "Stage Hunk" },
--         --     u = { "<cmd>GitGutterUndoHunk<cr>", "Undo Hunk" },
--         --     p = { "<cmd>GitGutterPreviewHunk<cr>", "Preview Hunk" },
--         -- },
--     -- },
-- }, { prefix = "<leader>" })
