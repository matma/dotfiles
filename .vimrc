" brand new vimrc

" default encoding
set encoding=utf-8
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
" nowrap by default
set nowrap
" line numbers
set number
set relativenumber
" searching
set hlsearch
set smartcase
set ignorecase
" no backup
set nowritebackup
set noswapfile
set nobackup
" color scheme
colorscheme industry

" global files settings
au BufNewFile * set noeol

" global ignores
set wildignore+=*./node_modules/*,*./.git/*

" vundle stuff
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

" vundle plugins
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
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
Plugin 'scrooloose/nerdcommenter'

call vundle#end()

" turn on filetype plugins
filetype plugin indent on

" airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

" neocomplete
let g:neocomplcache_enable_at_startup = 1

" neosnippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" keys
" set global leader key
let mapleader="\\"

" disable arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

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
