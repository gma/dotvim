" Show whitespace
set listchars=tab:>-,trail:·,eol:$,extends:#,nbsp:·
nmap <silent> <leader>s :set nolist!<CR>

" Edit and source vimrc
nnoremap <leader>ve :split $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

" Text bubbling (http://vimcasts.org/episodes/bubbling-text/)
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Switch windows with Ctrl + a movement key
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use %% for current filename in ':' commands
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Replace silversearcher with Ripgrep
cnoreabbrev Ag Rg
