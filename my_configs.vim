set nu
set foldcolumn=0

set tags=tags;
set autochdir

let g:go_version_warning = 0

set cursorline
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

autocmd BufNewFile *.py,*.sh exec ":call SetTitle()"
func SetTitle()
    if &filetype == 'sh'
        call setline(1, "#!/bin/bash")
        call append(line("."), "")
    endif
    if &filetype == 'python'
        call setline(1, "#!/usr/bin/env python")
        call append(line("."), "#coding: utf-8")
        call append(line(".")+1, "")
    endif
endfunc
autocmd BufNewFile * normal G
