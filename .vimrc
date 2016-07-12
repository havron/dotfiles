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
set complete+=kspell

" size of an "indent"
set shiftwidth=2
set autoindent
inoremap <S-Tab> <C-V><Tab>
