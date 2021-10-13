set nu
set foldcolumn=0

set history=2000

set tags=tags;
set autochdir

let g:go_version_warning = 0

set cursorline
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

set gcr=a:block-blinkon0 "禁止光标闪烁。闪烁会干扰视线
set nocp " nocompatible vim默认兼容vi的按键真是不舒服

" enable mouse，可以在终端中使用鼠标
" set mouse=a

" enable Ctrl-C to copy
" set mount=v

" enable Ctrl-C to copy selected content to system clipboard
" set mouse=a使得鼠标选中区域内容时进入visual mode，visual mode下映射ctrl-c为复制到+寄存器
" 对应到系统粘贴板，则在vim内或外部任意窗口中都可以用ctrl-v (command-v)来粘贴内容
vmap <C-c> "+y


" font
" Set font according to system
if has("mac") || has("macunix")
    set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    "set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11,Consolas:h12
    set gfn=Consolas:h12
elseif has("gui_gtk2")
    "set gfn=Ubuntu\ Mono:h11,IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
    set gfn=Ubuntu\ Mono\ 11
elseif has("linux")
    set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
    set gfn=Monospace\ 11
endif



" nerdtree's window should be in left instead of silly right
let g:NERDTreeWinPos = 'left'

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


" 保存代码文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,python,java,go,php,javascript,html,xml,yml autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()



" 新建文件时，自动添加文件头
" ref: https://github.com/wklken/k-vim
autocmd BufNewFile *.py,*.sh exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    if &filetype == 'sh'
        call setline(1, "#!/bin/bash")
        call append(line("."), "")
    endif
    
    if &filetype == 'python'
        call setline(1, "#!/usr/bin/env python")
        call append(line("."), "#coding: utf-8")
        call append(line(".")+1, "")
    endif
    
    normal G
    normal o
    normal o
endfunc


" 开启解析 compile_commands 的功能
let g:ale_c_parse_compile_commands = 1

" ale 将在工程目录下的 build 和 . 中搜索 compile_commands.json
let g:ale_c_build_dir_names = ['build','.']

""""""""""""""""""""""""""
"
" vim-clang-format
"
""
let g:clang_format#command = 'clang-format-8'
let g:clang_format#style_options = {
            \ "Language" : "Cpp",
            \ "BasedOnStyle" : "LLVM",
            \ "Standard": "Auto",
            \ "IndentWidth" : 4,
            \ "UseTab" : 'false',
            \ "AccessModifierOffset": -4,
            \ "AllowShortFunctionsOnASingleLine": "Empty",
            \ "PointerAlignment": "Left",
            \ "DerivePointerAlignment": "false",
            \"ReflowComments":  "true",
            \"SpacesBeforeTrailingComments": '2',
            \ "ColumnLimit" : 100}

map <C-K> :pyf <path-to-this-file>/clang-format.py<cr>        
imap <C-K> <c-o>:pyf <path-to-this-file>/clang-format.py<cr>

"\u21A6 is ⇥
set listchars=eol:$,tab:⇥¬¬,trail:~,extends:>,precedes:<,space:·

"""""""""""""""""""""""""""""""""""""""""""
" don't add newline if found [noeol]
" i.e. disalbe [noeol][converted]
"""""""""""""""""""""""""""""""""""""""""""
set nofixendofline


" default updatetime 4000ms is not good for async update
set updatetime=100

" turn on doxygen syntax highlight for .h/.hpp/.c/.cpp files
autocmd BufNewFile,BufReadPost *.h,*.hpp,*.c,*.cpp set syntax=cpp.doxygen



" ===
" === Tab management 标签页管理
" ===
" Create a new tab with tu
noremap tu :tabe<CR>
noremap tU :tab split<CR>
" Move around tabs with tn and ti
noremap tn :-tabnext<CR>
noremap ti :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>

"===
"=== Terminal Behaviors
"===
"autocmd TermOpen term://* startinsert
" 使用 Ctrl + j 召唤出terminal， 就像 VSCode 一样
noremap <C-j> :terminal<CR>
