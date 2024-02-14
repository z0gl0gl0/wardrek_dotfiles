local wk = require("which-key")

wk.register({
    u = { vim.cmd.UndotreeToggle, "Toggle Undotree" }
}, {prefix = "<leader>"})
