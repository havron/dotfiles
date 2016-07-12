" Cool files
:au BufNewFile,BufRead *.cool setf cool 
:cmap W w
:cmap Q q
:colorscheme delek
" size of a hard tabstop
set tabstop=2

" always uses spaces instead of tab characters
set expandtab
autocmd Filetype mkd setlocal spell

" size of an "indent"
set shiftwidth=2
set autoindent
inoremap <S-Tab> <C-V><Tab>
