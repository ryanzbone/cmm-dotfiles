runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
call pathogen#helptags()

let mapleader=","

set nocompatible
set number
set ruler
set tabstop=2 shiftwidth=2
autocmd Filetype php setlocal tabstop=4 shiftwidth=4
set expandtab
set autoindent
set hlsearch
set ignorecase
set runtimepath^=~/.vim/bundle/ctrlp.vim
set shortmess+=A
set laststatus=2
set backspace=2
set mouse=a
set colorcolumn=100
highlight ColorColumn ctermbg=DarkGrey
syntax on
filetype plugin indent on

" Move left and right through tabs, up and down through buffers
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-j> :bn<CR>
map <C-k> :bp<CR>

" Fast save and quit
map <Leader>w :w<Enter>
map <Leader>q :q<Enter>

map <Leader>cop :RuboCop<Enter>

map <Leader>s :SplitjoinSplit<Enter>
map <Leader>j :SplitjoinJoin<Enter>
map <Leader>ci :!git commit -v<Enter>
imap jj <Esc>
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

set pastetoggle=<Leader>p

" Clear search highlighting, hooray!
map <Leader><Space> :noh<Enter>

" Vim Rails leader commands
map <Leader>a :A<Enter>
map <Leader>e :Emodel<Enter>
map <Leader>v :Eview<Enter>
map <Leader>r :R<Enter>

command W w
command Q q
command WQ wq
command Wq wq

let g:airline_powerline_fonts       = 1
let g:vim_markdown_folding_disabled =1

set pastetoggle=<F2>

" Trim whitespace
autocmd BufWritePre * :TrailerTrim

" Commonly misspelled words
iab recieve receive
iab ture true

" Ctrl-c/x to clipboard
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

" Ruby Runner settings
"command! FR set filetype=ruby
"map <leader>r :RubyBuffer <cr>

let g:promptline_preset = {
        \'a' : [ '%*' ],
        \'b' : [ '$USER'],
        \'c' : [ promptline#slices#cwd() ],
        \'y' : [ promptline#slices#vcs_branch() ]}

" GitGutter colors
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

" xml formatting
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

" Tabularize mappings
nmap<Leader>t= :Tabularize /=<CR>
vmap<Leader>t= :Tabularize /=<CR>
nmap<Leader>t: :Tabularize /:\zs<CR>
vmap<Leader>t: :Tabularize /:\zs<CR>
nmap<Leader>t{ :Tabularize /{<CR>
vmap<Leader>t{ :Tabularize /{<CR>
nmap<Leader>t' :Tabularize /'<CR>
vmap<Leader>t' :Tabularize /'<CR>
nmap<Leader>t" :Tabularize /"<CR>
vmap<Leader>t" :Tabularize /"<CR>

let g:ctrlp_use_caching = 0
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
        \ }
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

let g:ctrlp_custom_ignore = '^vendor\/bundle*'

" Show vertical column on cursor location in haml files
autocmd FileType haml setlocal cursorcolumn

" Only use ctags and current file for autocomplete
set complete=.,t
