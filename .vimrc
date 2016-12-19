set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'rust-lang/rust.vim'

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

" Cool files
au BufNewFile,BufRead *.cool setf cool 
:cmap W w
:cmap Q q
:colorscheme delek
" size of a hard tabstop
set tabstop=2

" always uses spaces instead of tab characters
set expandtab
augroup Markdown
au Filetype mkd setlocal spell spelllang=en_us
augroup END

au BufRead,BufNewFile *.md setlocal spell spelllang=en_us
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.txt setlocal spell spelllang=en_us
au BufRead,BufNewFile *.txt setlocal textwidth=80
au BufRead,BufNewFile *.tex setlocal spell spelllang=en_us
au BufRead,BufNewFile *.tex setlocal textwidth=80
set complete+=kspell

" size of an "indent"
set shiftwidth=2
set autoindent
inoremap <S-Tab> <C-V><Tab>

" sets the yank buffer to hold <400 lines (default is 50)
:set viminfo='100,<400,s10,h
