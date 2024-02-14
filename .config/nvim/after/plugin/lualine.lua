require('lualine').setup {
    options = {
        theme = 'gruvbox-material',
        component_separators = {''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = { 'NvimTree' }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {'filename'},
        lualine_x = {'diagnostics'},
        lualine_y = {'%l:%c', '%p%% / %L'},
        lualine_z = {"os.date('%H:%M', os.time())"}
    },
    inactive_sections = {
        lualine_c = { '%f %y %m' },
        lualine_x = {},
    },
}
