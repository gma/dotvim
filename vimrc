if &compatible
  set nocompatible
endif

let mapleader = ","

" Plugins
packadd! matchit
source ~/.vim/packages.vim
source ~/.vim/options.vim
source ~/.vim/mappings.vim

" Disable netrw banner
let g:netrw_banner = 0

" Switch windows with Ctrl + a movement key
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use %% for current filename in : commands
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Replace silversearcher with Ripgrep
cnoreabbrev Ag Rg

""" Make it easy to modify vim settings on the fly.
""
" From http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/
" Quickly open the vim config file in a new tab.
nnoremap <leader>ve :split $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

" Show whitespace
set listchars=tab:>-,trail:·,eol:$,extends:#,nbsp:·
nmap <silent> <leader>s :set nolist!<CR>

nmap <LEADER>y :YRShow<CR>

" Text bubbling (http://vimcasts.org/episodes/bubbling-text/)
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

if has("autocmd")
  filetype plugin indent on  " enable filetype detection
endif

filetype plugin on

" Editing mail
if has("autocmd")
  autocmd FileType mail setlocal wrap
  autocmd FileType mail setlocal linebreak    " wrap on word boundaries
  autocmd FileType mail setlocal nojs
  autocmd FileType mail setlocal nosmartindent
  autocmd FileType mail match Visual '\s\+$'
endif

" Indentation
if has("autocmd")
  autocmd FileType sh setlocal shiftwidth=4
  autocmd FileType css setlocal shiftwidth=4
  autocmd FileType elm setlocal shiftwidth=4
endif

" Git
if has("autocmd")
  " don't jump to last position within .git/COMMIT_EDITMSG files
  autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
endif

" Make files
if has("autocmd")
  autocmd FileType make set tabstop=8
  autocmd FileType make setlocal shiftwidth=8
endif

" Markdown
if has("autocmd")
  autocmd FileType markdown set wrap
  autocmd FileType markdown set linebreak
endif
let g:markdown_enable_spell_checking = 0

" Python
if has("autocmd")
  autocmd FileType python setlocal shiftwidth=4
  autocmd FileType python setlocal softtabstop=4
  autocmd FileType python setlocal tabstop=4
  autocmd FileType python setlocal textwidth=0
  autocmd FileType python setlocal wrapmargin=0
  if filereadable(".use-black")
    autocmd BufWritePre */Projects/*/*.py execute ':Black'
  endif
endif
nnoremap <F9> :Black<CR>
let g:black_linelength = 80

" Ruby
if has("autocmd")
  autocmd FileType ruby setlocal wrapmargin=0
end
au BufRead,BufNewFile *.rabl setf ruby
au BufRead,BufNewFile *.jbuilder setf ruby
set completefunc=syntaxcomplete#Complete  " for vim-ruby-minitest
set tags+=gems.tags

" Parse Rails deprecation warnings from logs
" (load them into quickfix window with `vi -q log`)
set errorformat+=DEPRECATION\ WARNING:\ %m\ \(called\ %.%\\+\ %f:%l\)

" Sysadmin
if has("autocmd")
  autocmd FileType tf set nowrap   " Terraform
endif

" Web
if has("autocmd")
  autocmd FileType haml set nowrap
  autocmd FileType sass set textwidth=0
  " autocmd BufWritePost *.coffee silent CoffeeMake! | cwindow | redraw!
endif
 
" Useful for running vi within irb
" From http://vimcasts.org/episodes/running-vim-within-irb/
if has("autocmd")
  " Restore cursor position
  "autocmd BufReadPost *
  "  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  "  \   exe "normal! g`\"" |
  "  \ endif
endif
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" Functions and commands
command! TagFiles :call EchoTags()
function! EchoTags()
  echo join(split(&tags, ","), "\n")
endfunction

" Automation
if has("autocmd")
  autocmd BufWritePost */suckless/*/config.h !make && sudo make install
endif

" Host specific config
let hostfile = $HOME . '/.vim/vimrc-' . substitute(hostname(), "\\..*", "", "")
if filereadable(hostfile)
  exe 'source ' . hostfile
endif
