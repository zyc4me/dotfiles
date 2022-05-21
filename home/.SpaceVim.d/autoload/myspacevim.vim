function! myspacevim#before() abort
  "使用 Ctrl + j 召唤出 terminal, 就像 VSCode 一样
  noremap <C-j> :terminal<CR>

  "有些按键从来不想用，但容易大小写弄错导致误用
  "那就干脆干掉它们
  cnoreabbrev X x
  cnoreabbrev W w

  " enable mouse，可以在终端中使用鼠标， 最常见情况是选中并复制
  set mouse=a

  " enable Ctrl-C to copy
  " set mount=v

  " enable Ctrl-C to copy selected content to system clipboard
  " set mouse=a使得鼠标选中区域内容时进入visual mode，visual mode下映射ctrl-c为复制到+寄存器
  " 对应到系统粘贴板，则在vim内或外部任意窗口中都可以用ctrl-v (command-v)来粘贴内容
  "vmap <C-c> "+y


  "高亮当前行
  set cursorline
  "hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
  hi CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

  "早年用ctags的习惯
  set tags=tags;
  set autochdir

  "\u21A6 is ⇥
  set listchars=eol:$,tab:⇥¬¬,trail:~,extends:>,precedes:<,space:·

  " turn on doxygen syntax highlight for .h/.hpp/.c/.cpp files
  autocmd BufNewFile,BufReadPost *.h,*.hpp,*.c,*.cpp set syntax=cpp.doxygen

endfunction


