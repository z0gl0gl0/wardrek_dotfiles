local wk = require("which-key")

wk.register({
    g = {
        name = "Git",
        s = { vim.cmd.Git, "Git status" },
        h = {
            name = "Gitgutter",
            s = { "<cmd>GitGutterStageHunk<cr>", "Stage Hunk" },
            u = { "<cmd>GitGutterUndoHunk<cr>", "Undo Hunk" },
            p = { "<cmd>GitGutterPreviewHunk<cr>", "Preview Hunk" },
        },
    },
}, { prefix = "<leader>" })
