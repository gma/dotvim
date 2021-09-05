" Graphical Vim config file
"
set encoding=utf-8
set guioptions-=T           " hide the toolbar
set guioptions-=r           " hide the scrollbars
set guioptions-=R           " hide the scrollbars with vertical split
set guioptions-=l           " hide the scrollbars
set guioptions-=L           " hide the scrollbars with vertical split
set guifont=Inconsolata:h15
set lines=40 columns=85     " window dimensions
set number                  " line numbers

" colorscheme solarized
" set background=dark
set colorcolumn=81

" Glenn's config which opens two splits when you're editing a project
" if isdirectory(@%) == 1
"   vsplit
"   set lines=50
"   set columns=171
" else
"   set lines=40
"   set columns=85
" endif

nmap <leader>1 :set columns=85<CR><C-w>o
nmap <leader>2 <C-w>o:set columns=171<CR><C-w>v
nmap <leader>3 <C-w>o:set columns=117<CR><leader>d<C-l>

function! TallWindow()
  set lines=56
endfunction
command! Tw :call TallWindow()
command! TallWindow :call TallWindow()

let hostfile = $HOME . '/.vim/gvimrc-' . substitute(hostname(), "\\..*", "", "")
if filereadable(hostfile)
  exe 'source ' . hostfile
endif
