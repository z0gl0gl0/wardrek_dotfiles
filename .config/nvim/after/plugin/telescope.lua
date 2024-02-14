local builtin = require('telescope.builtin')

require('telescope').setup {
    defaults = {
        file_ignore_patterns = {".git/", ".cache", "%.o", "%.a", "%.out", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip", "%.png", "%.jpg", "%.nc", "%.swp"},
    },
    pickers = {
        find_files = {
            hidden = true,
        }
    }
}

local wk = require("which-key")

wk.register({
    f = {
        name = "Fuzzy find",
        p = { builtin.find_files, "Find Project Files" },
        g = { builtin.git_files, "Find Git Files" },
        b = { builtin.buffers, "Find Buffers" },
        r = { builtin.oldfiles, "Find Recent Files" },
        -- t = { builtin.tags, "Find Tags" },
        l = { builtin.current_buffer_fuzzy_find, "Find Lines" },
    },
}, { prefix = "<leader>" })
