set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'majutsushi/tagbar'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/syntastic'
Plugin 'flazz/vim-colorschemes'
Plugin 'suan/vim-instant-markdown'
Plugin 'urso/haskell_syntax.vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'shougo/vimproc.vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'nbouscal/vim-stylish-haskell'
Plugin 'mpickering/hlint-refactor-vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature  
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
  endif   

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
syntax enable
colorscheme fx
colorscheme luna-term
map <C-n> :NERDTreeToggle<CR>
vmap <C-C> "+yi
imap <C-V> <esc>"+gPi
map <silent> tw :GhcModTypeInsert<CR>:w<CR>
map <silent> ts :GhcModSplitFunCase<CR>:w<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>
imap jj <Esc>
set number
set showmatch
set showmode
setlocal formatprg=hindent
set showcmd
set wildmenu
set matchtime=2
set matchpairs+=<:>
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nobackup
set noswapfile
set hlsearch
set incsearch
set autoindent
set autochdir
nmap j gj
nmap k gk
nmap <UP> gk
nmap <DOWN> gj
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
