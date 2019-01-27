set nu
set foldcolumn=0

set tags=tags;
set autochdir

let g:go_version_warning = 0

set cursorline
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

set gcr=a:block-blinkon0 "禁止光标闪烁。讨厌光标闪，闪是装逼。
set nocp " nocompatible vim默认兼容vi的按键真是不舒服

let g:is_windows = 0
let g:is_linux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:is_windows = 1
else
    let g:is_linux = 1
endif

"" 判断是终端还是gvim
if has("gui_running")
    let g:is_gui=1
else
    let g:is_gui=0
endif

if (g:is_windows)
    if (g:is_gui)
        "" 启用win下的快捷键，包括ctrl+c, ctrl+v, shift+insert等
        "" note: 需要vim8.1或更高版本，才能在PowerShell/cmd中开启的vim中正确显示中文
        "" 终端(cmd/powershell)里的vim不需要这些快捷键。否则v命令键无法使用。
        source $VIMRUNTIME/mswin.vim
        behave mswin
    endif


    "" 
    set encoding=utf-8
    set fileencoding=utf-8
    set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
    set langmenu=zh_CN.UTF-8
    language message zh_CN.UTF-8

    if (g:is_gui)
        "" 解决菜单中文乱码
        "" 需要先设定encoding和fileencoding等
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
    endif
endif


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


"""""""""""""""""""
"
" ale config, for c/c++ syntax checking
"
"   sudo apt install cppcheck
"
let g:ale_linters = {
\	'c': ['gcc', 'cppcheck'],
\	'cpp': ['gcc', 'cppcheck'],
}

