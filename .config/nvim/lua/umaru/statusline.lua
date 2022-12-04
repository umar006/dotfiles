require('lualine').setup {
    options = {
        theme = "catppuccin" ,
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = '' }
    },
    sections = {
        lualine_c = {
            {
                    'filename',
                    file_status = true,
                    path = 1,
            }
        }
    }
}

