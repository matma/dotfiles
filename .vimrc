" brand new vimrc

" default encoding
set encoding=utf-8
" tty settings
set t_Co=256
set title
set ttyfast
" nocompatible to be more useful
set nocompatible
" leave insert mode faster
set ttimeoutlen=50
" syntax for highlighting
syntax on
" expandtab for better tab use
set expandtab
" modelines ?
set modelines=0
" two spaces as a default width
set shiftwidth=2
set tabstop=2
" text width to 79
set textwidth=79
set colorcolumn=+1
" nowrap by default
set nowrap
" line numbers
set number
set relativenumber
" autoread changed files
set autoread
" searching
set hlsearch
set smartcase
set ignorecase
" no backup
set nowritebackup
set noswapfile
set nobackup
" backspace should work all the time
set backspace=indent,eol,start
" color scheme
colorscheme industry

" global files settings
au BufNewFile * set noeol

" global ignores
set wildignore+=*/node_modules/*,*/.git/*

" vundle stuff
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

" vundle plugins
call vundle#begin()

Plugin 'gmarik/vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'flazz/vim-colorschemes'
Plugin 'shougo/neocomplcache'
Plugin 'shougo/neosnippet'
Plugin 'shougo/neosnippet-snippets'
Plugin 'honza/vim-snippets'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'vasconcelloslf/YUNOcommit.vim'

call vundle#end()

" turn on filetype plugins
filetype plugin indent on

" airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

" ctrlp
let g:ctrlp_use_caching = 1

" neocomplete
let g:neocomplcache_enable_at_startup = 1

" neosnippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" keys
" set global leader key
let mapleader="\\"

" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
map Q <NOp>

" leader mappings
nmap <leader>fef ggVG=
" nerd commenter
map <leader>/ <leader>c<space>

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" neosnippets
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

" if the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>

" syntastic for C
let g:syntastic_c_include_dirs = [ 'includes', 'headers', 'deps' ]
" syntastic for JS
let g:syntastic_javascript_checkers = ['jsxhint'] 

" for reading man pages
let $PAGER=''
