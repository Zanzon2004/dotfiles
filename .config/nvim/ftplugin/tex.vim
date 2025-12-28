" ~/.config/nvim/ftplugin/tex.vim 


function! Compile() 
    w
    "this is to ensure that you're in the .tex working dir
    "if you ever decide to edit and compile from another path (:cd is global
    "the vim session)
    cd %:p:h

    "silent !pdflatex %:p

    "recognize the manual compiler file i made
    compiler tex

    "open quickfix naturally if there's an error
    autocmd QuickFixCmdPost make cwindow

    "make is redefined in the compiler file for compilation with error
    "handling check ~/.config/nvim/compiler/tex.vim
    silent make

    " run only if there are NO errors
    if empty(getqflist())
        echo "compiled"
    endif

    "getting back to the original path after cd %:p:h
    cd -
endfunction

"function! OnError(channelname: channel, msg: string)
"    echoerr "process has finished with error: " .. msg
"endfunction

function! Openpdf()
    " for reading synctex file (check the compiler file) 
    const opt1= "--synctex-forward "

    " for getting the corresponding location in the .pdf file using the
    " location you're on in the .tex file (that's the reason of including
    " synctex) 
    const opt2= line(".") .. ":" .. col(".") .. ":" .. '%:p'
    
    " if bohtered by highlighting in zathura when opening in a specific
    " location copy the config to another file and change the highlight
    " transparency option and source it like this:
    "const opt3= "-c ~/.config/zathura/synctex"

    exec "silent !zathura '%:r'.pdf " .. opt1 .. opt2 .. "& "

    "const job = ["silent !zathura '%:r'.pdf ", opt1, opt2, "& "]
    "call job_start(job, {"err_cb": OnError})
endfunction


nnoremap <buffer> <localleader>c :call Compile()<CR>
nnoremap <buffer> <localleader>q :call Openpdf()<CR>



nnoremap <buffer> <localleader>so :so ~/.config/nvim/ftplugin/tex.vim<CR>


