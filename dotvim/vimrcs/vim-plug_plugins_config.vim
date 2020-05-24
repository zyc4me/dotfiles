"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
"let s:vim_runtime = expand('<sfile>:p:h')."/.."
"call pathogen#infect(s:vim_runtime.'/sources_forked/{}')
"call pathogen#infect(s:vim_runtime.'/sources_non_forked/{}')
"call pathogen#infect(s:vim_runtime.'/my_plugins/{}')
"call pathogen#helptags()

""""""""""""""""""""""""""""""
" => install vim-plug if need
""""""""""""""""""""""""""""""
if empty(glob('~/.vim_runtime/autoload/plug.vim'))
    silent !curl -fLo ~/.vim_runtime/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""""""""""""""""""""""""""""""
" => plugin list
""""""""""""""""""""""""""""""
" Plugins will be downloaded under the specified directory
call plug#begin('~/.vim_runtime/plugged')

" Declare the list of plugins
" - local folder: sources forked
Plug '~/.vim_runtime/sources_forked/peaksea'
Plug '~/.vim_runtime/sources_forked/set_tabline'
Plug '~/.vim_runtime/sources_forked/vim-irblack-forked'
Plug '~/.vim_runtime/sources_forked/vim-peepopen'

" - github repos
Plug 'mileszs/ack.vim'
""Plug 'w0rp/ale'  the original repo contains a large image. don't use it
""Plug 'zchrissirhcz/ale' " use my fork. still slow
Plug 'https://gitee.com/aczz/ale.git'
Plug 'jiangmiao/auto-pairs'
Plug 'corntrace/bufexplorer'
Plug 'yuttie/comfortable-motion.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/goyo.vim'
Plug 'morhetz/gruvbox'
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/mayansmoke'
Plug 'vim-scripts/mru.vim'
Plug 'scrooloose/nerdtree'
Plug 'chr4/nginx.vim'
Plug 'amix/open_file_under_cursor.vim'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/snipmate-snippets'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/tlib'
Plug 'tpope/tpope-vim-abolish'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'sophacles/vim-bundle-mako'
Plug 'kchmck/vim-coffee-script'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-commentary'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'terryma/vim-expand-region'
Plug 'nvie/vim-flake8'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'michaeljsmith/vim-indent-object'
Plug 'fisadev/vim-isort'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-markdown'
Plug 'terryma/vim-multiple-cursors'
Plug 'digitaltoad/vim-pug'
Plug 'therubymug/vim-pyte'
Plug 'tpope/vim-repeat'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'amix/vim-zenroom2'
""Plug 'Valloric/YouCompleteMe', { 'do': './install.py'  }

""Plug 'https://github.com/rhysd/vim-clang-format.git'

" List ends here. Remember to call :PlugInstall
call plug#end()

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']

nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-n> <Plug>yankstack_substitute_newer_paste


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'


""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_select_all_word_key = '<A-s>'
let g:multi_cursor_start_key           = 'g<C-s>'
let g:multi_cursor_select_all_key      = 'g<A-s>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'javascript': ['jshint'],
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'errcheck']
\}

nmap <silent> <leader>a <Plug>(ale_next_wrap)

" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>



" YCM
"YouCompleteMe
set completeopt=longest,menu
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>*'
let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_strings=1
let g:ycm_complete_in_comments=1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_min_num_identifier_candidate_chars=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
" [ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_goto_buffer_command='vertical-split'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_rust_src_path = '/usr/local/rustc-1.6.0/src'
let g:ycm_filetype_blacklist = {'tagbar' : 1, 'nerdtree' : 1}
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>

