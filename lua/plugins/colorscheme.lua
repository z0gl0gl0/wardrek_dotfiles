function ColorMyPencils(color)
    color = color or "gruvbox-material"
    vim.cmd.colorscheme(color)
    -- No background
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
    -- No background in floating windows
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    -- No background in non-current windows
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    -- Better line number
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#928374", bg = "none" })
    -- Current line number highlighted
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#fabd2f", bg = "none", bold = true })

    -- Diagnostic messages colors
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { link="DiagnosticFloatingError" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { link="DiagnosticFloatingWarn" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { link="DiagnosticFloatingInfo" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { link="DiagnosticFloatingHint" })
end

return {
    "sainnhe/gruvbox-material",
    lazy = false, -- make sure we load this during startup
    priority = 1000, -- make sure to load this before all other plugins
    config = function()
        ColorMyPencils()
    end,
}
