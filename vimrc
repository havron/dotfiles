" setup plugins
execute pathogen#infect()
syntax on
filetype plugin indent on

" for tree directory if desired...
" autocmd vimenter * NERDTree

" helpful for commenter
let mapleader = ","
let g:gitgutter_enabled = 1
" nice colorschemes
colorscheme default
" hi Visual ctermbg
" works for now, but highlighting could be improved.
hi Visual term=reverse cterm=reverse

" set up rainbow (nested) parentheses
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" a bunch of default rainbow parens config
let g:rainbow_conf = {
  \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
  \   'ctermfgs': ['lightblue', 'darkyellow', 'darkcyan', 'darkmagenta', 'brown'],
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

" Cool files
au BufNewFile,BufRead *.cool setf cool 
au BufNewFile,BufRead *.cl setf cool

" hacky WQ => wq mapping, but good enough for my purposes.
cmap W w
cmap Q q
" move to beginning/end of line, just use lower 'e' and 'b' for normal word
" navigation
nnoremap B ^
nnoremap E $

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

" OblivC 'support'
" Adding these lines in .vimrc usually helps with .oc and .oh files

function SetOblivcOptions()
  " Hijack C syntax highlighting and indenting
  set filetype=c
  syn match ocConditional "\<obliv\s\+if\>"
  syn keyword cType frozen
  syn match ocOblivType "\<obliv\>\(\s\+if\>\)\@!"
  syn match cStatement "\~obliv\>"
  hi def link ocConditional Conditional
  hi def link ocOblivType Type
endfunction

autocmd BufNewFile,BufRead *.o[ch] call SetOblivcOptions()

set complete+=kspell

" size of an "indent"
set shiftwidth=2
"set autoindent
inoremap <S-Tab> <C-V><Tab>

" sets the yank buffer to hold <400 lines (default is 50)
set viminfo='100,<400,s10,h
