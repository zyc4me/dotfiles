"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocp "nocompatible
set nu "line number
set ai  "auto indent
set history=1000
set ruler	"always show cursor
set novisualbell
set showcmd	"always display command
set backspace=indent,eol,start	"make <BS>(backspace> available
""set relativenumber  相对行号，用起来不是很舒服。
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'klen/python-mode.git'
Bundle 'vim-ruby/vim-ruby.git'
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'scrooloose/nerdtree.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"my own configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu
set guifont=MONACO
syntax on
set novisualbell
set helplang=cn
set encoding=utf-8
set fileencoding=utf-8
""set cursorline
"set cursorcolumn
set cursorline
""set cursorcolumn
"hi CursorLine gui=underline

set smartindent
set tabstop=4
set shiftwidth=4
set showmode

"""""""""""""""""""""""""""""""""""""""""""""
"my ctags-setting:auto"
"""""""""""""""""""""""""""""""""""""""""""""
set tags=tags;
set autochdir


"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh'
		call setline(1,"\##################################################")
		call append(line("."), "\# Filename: ".expand("%")) 
		call append(line(".")+1, "\# Author: ChrisZZ") 
		call append(line(".")+2, "\# E-mail: zchrissirhcz@163.com") 
		call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "\##################################################") 
		call append(line(".")+5, "\#!/bin/bash") 
		call append(line(".")+6, "") 
	endif
	
	if &filetype == 'c'
		call setline(1, "/*") 
		call append(line("."), " * ==================================================")
		call append(line(".")+1, " *")
		call append(line(".")+2, " *       Filename:  ".expand("%")) 
		call append(line(".")+3, " *")
		call append(line(".")+4, " *    Description:  ")
		call append(line(".")+5, " *")
		call append(line(".")+6, " *        Version:  0.01")
		call append(line(".")+7, " *        Created:  ".strftime("%c")) 
		call append(line(".")+8, " *         Author:  ChrisZZ, zchrissirhcz@163.com")
		call append(line(".")+9," *        Company:  ZJUT")
		call append(line(".")+10, " *")
		call append(line(".")+11, " * ==================================================")
		call append(line(".")+12, " */")
		call append(line(".")+13, "#include <stdio.h>")
		call append(line(".")+14, "")
		call append(line(".")+15, "int main(){")
		call append(line(".")+16, "")
		call append(line(".")+17, "	return 0;")
		call append(line(".")+18, "}")
	endif
	if &filetype == 'cpp'
		call setline(1, "/*") 
		call append(line("."), " * ==================================================")
		call append(line(".")+1, " *")
		call append(line(".")+2, " *       Filename:  ".expand("%")) 
		call append(line(".")+3, " *")
		call append(line(".")+4, " *    Description:  ")
		call append(line(".")+5, " *")
		call append(line(".")+6, " *        Version:  0.01")
		call append(line(".")+7, " *        Created:  ".strftime("%c")) 
		call append(line(".")+8, " *         Author:  ChrisZZ, zchrissirhcz@163.com")
		call append(line(".")+9," *        Company:  ZJUT")
		call append(line(".")+10, " *")
		call append(line(".")+11, " * ==================================================")
		call append(line(".")+12, " */")
		call append(line(".")+13, "#include <iostream>")
		call append(line(".")+14, "using namespace std;")
		call append(line(".")+15, "int main(){")
		call append(line(".")+16, "")
		call append(line(".")+17, "    return 0;")
		call append(line(".")+18, "}")
	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G

endfunc
"搜索
"set incsearch
"set hlsearch
set showmatch  "括号配对
set hlsearch
set incsearch


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""颜色配置  color config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""colo elflord

""set t_Co=256
""colo molokai
""colo desert
if $TERM =~ "^xterm"	"图形化terminal，使用molokai
	set background=dark
	colo molokai 
else					"tty下，使用desert
	colo desert
endif

set showmatch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 语言的编译和运行           
" 支持的语言：java	     F5编译(保存+编译)  F6运行
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! CompileCode()
	exec "w"
	if &filetype == "java"
		exec "!javac -encoding utf-8 %"
	endif
	if &filetype == "ruby"
		exec "!ruby -Ku %"
	endif
	if &filetype == "python"
		exec "!python %"
	end
endfunc
func! RunCode()
	if &filetype == "java"
		exec "!java -classpath %:h; %:t:r"
	endif
endfunc

" F7 保存+编译
map <F7> :call CompileCode()<CR>

" F6 运行
map <F6> :call RunCode()<CR>

" F3 切换NERDTreeToggle模式
map <F3> :NERDTreeToggle<CR>
map <F3> :NERDTreeToggle<CR>

" F4 CommandT工具，for 快速浏览文件
map <F4> :CommandT<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""ruby
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <F7> :!ruby % <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""latex配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tex_flavor='latex'

let g:pydiction_menu_height=20

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 实用功能
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------引号 && 括号自动匹配
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
""inoremap { {}<ESC>i
""inoremap } <c-r>=ClosePair('}')<CR>
"插入{则为多行的配对方式，插入}为单行的配对
""imap { {}<ESC>i<CR><ESC>O
"":inoremap } {}<ESC>i  
"插入大括号 就是录制一个宏
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
:inoremap ` ``<ESC>i
function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf
"--------启用代码折叠，用空格键来开关折叠 
set foldenable		     " 打开代码折叠
set foldmethod=syntax        " 选择代码折叠类型
set foldlevel=100            " 禁止自动折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR> 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 文本格式和排版 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set list                        " 显示Tab符，->
set listchars=tab:\|\ ,         " 使用一高亮竖线代替
set tabstop=4			" 制表符为4
set autoindent			" 自动对齐（继承前一行的缩进方式）
set smartindent			" 智能自动缩进（以c程序的方式）
set softtabstop=4 
set shiftwidth=4		" 换行时行间交错使用4个空格
set noexpandtab			" 不要用空格代替制表符
""set expandtab
set cindent			" 使用C样式的缩进
set smarttab			" 在行和段开始处使用制表符
set nowrap			" 不要换行显示一行 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 状态行(命令行)的显示
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cmdheight=2		     " 命令行（在状态行下）的高度，默认为1，这里是2
set ruler				 " 右下角显示光标位置的状态行
set laststatus=2		 " 开启状态栏信息 
set wildmenu		     " 增强模式中的命令行自动完成操作 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件相关
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fenc=utf-8
set encoding=utf-8		" 设置vim的工作编码为utf-8，如果源文件不是此编码，vim会进行转换后显示
set fileencoding=utf-8		" 让vim新建文件和保存文件使用utf-8编码
set fileencodings=utf-8,gbk,cp936,latin-1
filetype on				     " 侦测文件类型
filetype indent on			     " 针对不同的文件类型采用不同的缩进格式
filetype plugin on			     " 针对不同的文件类型加载对应的插件
syntax on				     " 语法高亮
filetype plugin indent on    " 启用自动补全

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 查找
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch                 " 开启高亮显示结果
set nowrapscan               " 搜索到文件两端时不重新搜索
set incsearch                " 开启实时搜索功能
