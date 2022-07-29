set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/Users/saadtalaat/.vim/bundle/fzf/bin/fzf
call vundle#begin()
" Retain Vundle.vim during :PluginClean
Plugin 'Vundle.vim'
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
" Work directory tree
Plugin 'preservim/nerdtree'
" Indentation & Code styling helper
Plugin 'godlygeek/tabular'
call vundle#end()

" ALE configs
let g:ale_linters = {
\  "python": ["flake8", "pylint"],
\  "rust": ["cargo", "analyzer"],
\  "cpp": ["cpplint", "cc"],
\  "c": ["cc"],
\}

" Lightline configs
" - Show git-branch
" - Show file-path
let g:lightline = {
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'filepath','readonly', 'modified' ] ]
\ },
\ 'component_function': {
\   'gitbranch': 'FugitiveHead',
\   'filepath': 'FugitivePath'
\ },
\ }

" Ack config
" Use the-silver-searcher.
let g:ackprg = 'ag --vimgrep'

" Use some Awesome-vim configs
source ~/.vim/vimrcs/basic.vim
source ~/.vim/vimrcs/filetypes.vim

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
