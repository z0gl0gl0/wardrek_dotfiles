call wilder#setup({
            \ 'modes': [':', '/', '?'],
            \ 'next_key': '<Tab>',
            \ 'previous_key': '<S-Tab>',
            \ 'accept_key': '<Down>',
            \ 'reject_key': '<Up>',
            \ })
" 'highlighter' : applies highlighting to the candidates
call wilder#set_option('renderer', wilder#popupmenu_renderer({
            \ 'highlighter': wilder#basic_highlighter(),
            \ 'left': [ ' ', wilder#popupmenu_devicons() ],
            \ 'right': [ ' ', wilder#popupmenu_scrollbar() ],
            \ 'pumblend': 30,
            \ }))
