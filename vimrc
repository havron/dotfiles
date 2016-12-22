" setup plugins
execute pathogen#infect()
syntax on
filetype plugin indent on

" set up rainbow (nested) parentheses
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
 let g:rainbow_conf = {
      \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
      \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
      \   'operators': '_,_',
      \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \   'separately': {
      \       '*': {},
      \       'tex': {
      \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
      \       },
      \       'lisp': {
      \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
      \       },
      \       'vim': {
      \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
      \       },
      \       'html': {
      \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
      \       },
      \       'css': 0,
      \   }
      \}


"set tabstop=2
" Cool files
au BufNewFile,BufRead *.cool setf cool 
cmap W w
cmap Q q
colorscheme delek
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

" OblivC 'support', without new keywords
au BufRead,BufNewFile *.oc set filetype=c
au BufRead,BufNewFile *.oh set filetype=c
set complete+=kspell

" size of an "indent"
set shiftwidth=2
"set autoindent
inoremap <S-Tab> <C-V><Tab>

" sets the yank buffer to hold <400 lines (default is 50)
set viminfo='100,<400,s10,h
