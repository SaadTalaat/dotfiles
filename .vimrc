set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/fzf/bin/fzf
call vundle#begin()
" Retain Vundle.vim during :PluginClean
Plugin 'VundleVim/Vundle.vim'
" Ctags plugins
Plugin 'taglist.vim'
Plugin 'preservim/tagbar'
" Syntax analysis & highlighting
Plugin 'rust-lang/rust.vim'
Plugin 'dense-analysis/ale'
Plugin 'chr4/nginx.vim'
Plugin 'plasticboy/vim-markdown'
" Pairs parentheses
Plugin 'jiangmiao/auto-pairs'
" Color schemes & themes
Plugin 'morhetz/gruvbox'
Plugin 'crucerucalin/peaksea.vim'
Plugin 'wesgibbs/vim-irblack'
" Search utitiles
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'
" Git related
Plugin 'tpope/vim-fugitive'
" Better scrolling using <Ctrl-U>, <Ctrl-D>, <Ctrl-F>, <Ctrl-B>
Plugin 'yuttie/comfortable-motion.vim'
" Love to the status-bar
Plugin 'itchyny/lightline.vim'
Plugin 'maximbaz/lightline-ale'
" Work directory tree
Plugin 'preservim/nerdtree'
" Indentation & Code styling helper
Plugin 'godlygeek/tabular'
call vundle#end()

" ALE configs
let g:ale_linters = {
\  'python' : ['flake8', 'pylint'],
\  'rust'   : ['cargo', 'analyzer', 'rls', 'cspell'],
\  'cpp'    : ['cpplint', 'cc'],
\  'c'      : ['cc'],
\  'vim'    : ['vint', 'vimls'],
\}
let g:ale_fixers = {
\  'rust'   : ['rustfmt', 'remove_trailing_lines', 'remove_whitespace'],
\  'python' : ['autoflake','add_blank_lines_for_python_control_statements','isort',
\              'remove_trailing_lines', 'trim_whitespace', 'autoimport', 'autopep8'],
\}
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = 'Err'
let g:ale_echo_msg_warning_str = 'Warn'
let g:ale_echo_msg_format = '[%severity%][%linter%] %s'

" Lightline configs
" - Show git-branch
" - Show file-path
" - Show linter info
let g:lightline = {}
let g:lightline.active = {
\  'left'  : [['mode', 'paste'], ['gitbranch', 'relativepath', 'readonly', 'modified']],
\  'right' : [
\              ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
\              [ 'lineinfo' ],
\              [ 'percent' ],
\              [ 'fileformat', 'fileencoding', 'filetype'] 
\            ]
\}
let g:lightline.component_function = {
\   'gitbranch': 'FugitiveHead',
\}
let g:lightline.component_expand = {
\  'linter_checking': 'lightline#ale#checking',
\  'linter_infos': 'lightline#ale#infos',
\  'linter_warnings': 'lightline#ale#warnings',
\  'linter_errors': 'lightline#ale#errors',
\  'linter_ok': 'lightline#ale#ok',
\ }
let g:lightline.component_type = {
\     'linter_checking': 'right',
\     'linter_infos': 'right',
\     'linter_warnings': 'warning',
\     'linter_errors': 'error',
\     'linter_ok': 'right',
\ }
let g:lightline#ale#indicator_checking = 'Linting..'
let g:lightline#ale#indicator_warnings = 'Lint Warn: '
let g:lightline#ale#indicator_errors = 'Lint Error: '
let g:lightline#ale#indicator_ok = 'Lint OK'

" Ack config
" Use the-silver-searcher.
let g:ackprg = 'ag --vimgrep'

" Use some Awesome-vim configs
source ~/.vim/vimrcs/basic.vim
source ~/.vim/vimrcs/filetypes.vim
source ~/.vim/vimrcs/extended.vim

" Default tabs to two spaces
set tabstop=2
set shiftwidth=2
" Filetype specific tab width
au FileType javascript setl expandtab shiftwidth=2 tabstop=2
au FileType rust setl expandtab shiftwidth=4 tabstop=4
au FileType python setl expandtab shiftwidth=4 tabstop=4
" Have line numbers enabled, always.
set number

" --- Key Mappings ---- 
" Map leader key 
let mapleader = ","
" :FZF = ",p""
nnoremap <leader>p :FZF<CR>
" :Ag = ",["
nnoremap <leader>[ :Ag<CR>
" :NERDTree = ",n"
nnoremap <leader>n :NERDTreeToggle<CR>
" :Tagbar = ",t"
nnoremap <leader>t :TagbarToggle<CR>

" Avoid auto-completion from included files
" this is nasty with a big script-based codebase.
set complete-=i

" Use GruvBox colorscheme
colorscheme gruvbox
" Assume tags are always generated to ./tags
set tags=tags
