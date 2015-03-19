execute pathogen#infect()
call pathogen#helptags()
set nocompatible
set number
set ruler
set tabstop=2 shiftwidth=2
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
"map <C-l> :tabn<CR>
"map <C-h> :tabp<CR>
"map <C-j> :bn<CR>
"map <C-k> :bp<CR>
" Tmux navigator
"let g:tmux_navigator_no_mappings = 1

"nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
"nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
"nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
"nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

imap <Tab> <C-P>
let mapleader=","
map <Leader>w :w<Enter>
map <Leader>q :q<Enter>
map <Leader>cop :RuboCop<Enter>
imap jj <Esc>

" Clear search highlighting, hooray!
map <Leader><Space> :noh<Enter>

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
command! FR set filetype=ruby
map <leader>r :RubyBuffer <cr>

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
