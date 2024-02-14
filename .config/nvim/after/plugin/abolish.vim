" Exit if :Abolish isn't available.
if !exists(':Abolish')
    finish
endif

" Abolish path
let g:abolish_save_file = '/home/h21georg/.config/nvim/after/plugin/abolish.vim'

augroup abbrev
    autocmd!
    autocmd FileType markdown,plaintex Abolish xp{,s,t,ts} experi{ence,ences,ment,ments}
    autocmd FileType markdown,plaintex Abolish fc{,g} forecast{,ing}
    autocmd FileType markdown,plaintex Abolish app{,s} application{,s}
    autocmd FileType markdown,plaintex Abolish mt{,s} meeting{,s}
    autocmd FileType markdown,plaintex Abolish pred{,s} prediction{,s}
    autocmd FileType markdown,plaintex Abolish lat latitude
    autocmd FileType markdown,plaintex Abolish lon longitute
    autocmd FileType markdown,plaintex Abolish dm diffusion model
    autocmd FileType markdown,plaintex Abolish da data assimilation
    autocmd FileType markdown,plaintex Abolish 4dvn 4DVarNet
augroup END
