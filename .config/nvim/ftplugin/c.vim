" ~/.config/nvim/ftplugin/c.vim 


function! Compile() 
    w
    "this is to ensure that you're in the .tex working dir
    "if you ever decide to edit and compile from another path (:cd is global
    "the vim session)
    cd %:p:h

    "silent !cc -Wall -Wextra %:p -o '%:r'

    "recognize the manual compiler file i made
    compiler gcc

    "open quickfix naturally if there's an error
    autocmd QuickFixCmdPost make cwindow

    "make is redefined in the compiler file for compilation with error
    "handling check ~/.config/nvim/compiler/gcc.vim
    silent make

    " run only if there are NO errors
    if empty(getqflist())
        execute '!./' . expand('%:r')
    endif

    "getting back to the original path after cd %:p:h 
    cd -
endfunction


nnoremap <buffer> <localleader>c :call Compile()<CR>

" commenting in C
" nnoremap <buffer> <localleader># :'<,'>s/^/\/\/ /<CR>

nnoremap <buffer> <localleader>so :so ~/.config/nvim/ftplugin/c.vim<CR>
